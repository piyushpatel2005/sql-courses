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

-- TODO: Step 1: Insert below: Append player history with last_seen and both activity windows.
