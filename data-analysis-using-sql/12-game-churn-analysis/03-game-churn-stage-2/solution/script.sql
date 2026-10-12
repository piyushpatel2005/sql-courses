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
