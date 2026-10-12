SET TIME ZONE 'UTC';
CREATE TABLE game_players (player_id integer PRIMARY KEY, signed_up_at timestamptz NOT NULL, channel text);
INSERT INTO game_players VALUES
(1,'2025-01-10 00:00+00','organic'),(2,'2025-01-12 00:00+00','organic'),
(3,'2025-02-01 00:00+00','invite'),(4,'2025-02-02 00:00+00','organic'),
(5,'2025-03-25 00:00+00','invite'),(6,'2025-02-05 00:00+00','organic'),
(7,'2025-01-15 00:00+00','invite'),(8,'2025-03-18 00:00+00','invite'),
(9,'2025-02-10 00:00+00','organic'),(10,'2025-03-01 00:00+00','invite'),
(11,'2025-03-02 00:00+00',NULL),(12,'2025-04-01 00:00+00','organic');
CREATE TABLE game_events (ingest_id integer PRIMARY KEY, event_id text NOT NULL, player_id integer, kind text NOT NULL, happened_at timestamptz NOT NULL, received_at timestamptz NOT NULL);
INSERT INTO game_events VALUES
(1,'a1',1,'play','2025-03-10 10:00+00','2025-03-10 10:01+00'),
(2,'a2',1,'play','2025-03-20 10:00+00','2025-03-20 10:01+00'),
(3,'a2',1,'play','2025-03-20 10:00+00','2025-03-20 10:02+00'),
(4,'b1',2,'play','2025-03-12 10:00+00','2025-03-12 10:01+00'),
(5,'c1',3,'play','2025-03-17 23:59:59+00','2025-03-17 23:59:59+00'),
(6,'c2',3,'play','2025-03-18 00:00+00','2025-03-18 00:01+00'),
(7,'d1',4,'play','2025-03-04 00:00+00','2025-03-04 00:01+00'),
(8,'d2',4,'play','2025-04-01 00:00+00','2025-04-01 00:01+00'),
(9,'e1',5,'play','2025-03-25 10:00+00','2025-03-25 10:01+00'),
(10,'g1',7,'play','2025-03-01 10:00+00','2025-03-01 10:01+00'),
(11,'h1',8,'play','2025-03-18 00:00+00','2025-03-18 00:01+00'),
(12,'i1',9,'play','2025-03-08 10:00+00','2025-03-08 10:01+00'),
(13,'i2',9,'play','2025-03-25 10:00+00','2025-04-02 10:01+00'),
(14,'j1',10,'play','2025-03-15 10:00+00','2025-03-15 10:01+00'),
(15,'j2',10,'play','2025-03-31 23:59:58+00','2025-03-31 23:59:59+00'),
(16,'k1',11,'play','2025-03-12 10:00+00','2025-03-12 10:01+00'),
(17,'z1',99,'play','2025-03-20 10:00+00','2025-03-20 10:01+00'),
(18,'n1',6,'heartbeat','2025-03-24 10:00+00','2025-03-24 10:01+00'),
(19,'n2',6,'play','2025-02-01 10:00+00','2025-02-01 10:01+00');

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
CREATE OR REPLACE VIEW game_status AS
SELECT h.*, CASE
 WHEN account_mature = 0 THEN 'new_unobserved'
 WHEN last_seen IS NULL THEN 'never_played'
 WHEN baseline_plays = 0 THEN 'outside_baseline'
 WHEN recent_plays = 0 THEN 'inactive'
 ELSE 'retained' END AS activity_status
FROM game_player_history h;
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
