CREATE OR REPLACE VIEW game_observed AS
WITH versions AS (
 SELECT e.*, ROW_NUMBER() OVER (
  PARTITION BY event_id ORDER BY received_at DESC, ingest_id DESC
 ) AS version_rank
 FROM game_events e
 WHERE happened_at < TIMESTAMPTZ '2025-04-01 00:00+00'
   AND received_at < TIMESTAMPTZ '2025-04-01 00:00+00'
)
SELECT event_id, player_id, kind, happened_at, received_at
FROM versions WHERE version_rank = 1;
CREATE OR REPLACE VIEW game_activity AS
SELECT e.event_id, e.player_id, e.happened_at
FROM game_observed e JOIN game_players p ON p.player_id = e.player_id
WHERE e.kind = 'play' AND e.happened_at >= p.signed_up_at;
SELECT (SELECT COUNT(*) FROM game_events) AS raw_receipts,
       (SELECT COUNT(*) FROM game_observed) AS known_events,
       COUNT(*) AS valid_plays, COUNT(DISTINCT player_id) AS playing_accounts
FROM game_activity;

CREATE OR REPLACE VIEW game_player_history AS
SELECT p.player_id, p.signed_up_at, p.channel,
       MAX(a.happened_at) AS last_seen,
       COUNT(a.event_id) FILTER (
        WHERE a.happened_at >= TIMESTAMPTZ '2025-03-04 00:00+00'
          AND a.happened_at < TIMESTAMPTZ '2025-03-18 00:00+00'
       ) AS baseline_plays,
       COUNT(a.event_id) FILTER (
        WHERE a.happened_at >= TIMESTAMPTZ '2025-03-18 00:00+00'
          AND a.happened_at < TIMESTAMPTZ '2025-04-01 00:00+00'
       ) AS recent_plays,
       CASE WHEN p.signed_up_at <= TIMESTAMPTZ '2025-03-18 00:00+00'
            THEN 1 ELSE 0 END AS account_mature
FROM game_players p LEFT JOIN game_activity a ON a.player_id = p.player_id
WHERE p.signed_up_at < TIMESTAMPTZ '2025-04-01 00:00+00'
GROUP BY p.player_id, p.signed_up_at, p.channel;
SELECT player_id, last_seen::date::text AS last_play_date, baseline_plays, recent_plays, account_mature FROM game_player_history ORDER BY player_id;

CREATE OR REPLACE VIEW game_status AS
SELECT h.*, CASE
 WHEN account_mature = 0 THEN 'new_unobserved'
 WHEN last_seen IS NULL THEN 'never_played'
 WHEN baseline_plays = 0 THEN 'outside_baseline'
 WHEN recent_plays = 0 THEN 'inactive'
 ELSE 'retained' END AS activity_status
FROM game_player_history h;
SELECT player_id, activity_status FROM game_status ORDER BY player_id;

CREATE OR REPLACE VIEW game_cohorts AS
SELECT DATE_TRUNC('month', signed_up_at)::date AS signup_month,
       COALESCE(channel, 'unknown') AS channel,
       COUNT(*) AS eligible_players,
       COUNT(*) FILTER (WHERE activity_status = 'inactive') AS inactive_players,
       COUNT(*) FILTER (WHERE activity_status = 'retained') AS retained_players,
       ROUND(100.0 * COUNT(*) FILTER (WHERE activity_status = 'inactive')
             / NULLIF(COUNT(*), 0), 2) AS inactivity_pct
FROM game_status WHERE activity_status IN ('inactive', 'retained')
GROUP BY DATE_TRUNC('month', signed_up_at)::date, COALESCE(channel, 'unknown');
SELECT signup_month::text AS signup_month, channel, eligible_players, inactive_players, retained_players, inactivity_pct FROM game_cohorts ORDER BY signup_month, channel;

CREATE OR REPLACE VIEW game_reconciliation AS
WITH counts AS (
 SELECT COUNT(*) AS observed_accounts,
 COUNT(*) FILTER (WHERE activity_status NOT IN ('inactive','retained')) AS excluded_accounts,
 COUNT(*) FILTER (WHERE activity_status IN ('inactive','retained')) AS eligible_players,
 COUNT(*) FILTER (WHERE activity_status = 'inactive') AS inactive_players,
 COUNT(*) FILTER (WHERE activity_status = 'retained') AS retained_players
 FROM game_status
)
SELECT observed_accounts, excluded_accounts, eligible_players, inactive_players,
       retained_players, eligible_players -
       (SELECT COALESCE(SUM(eligible_players), 0) FROM game_cohorts) AS cohort_gap
FROM counts;
SELECT observed_accounts, excluded_accounts, eligible_players, inactive_players, retained_players, cohort_gap FROM game_reconciliation;

-- Add the next report checkpoint below.
