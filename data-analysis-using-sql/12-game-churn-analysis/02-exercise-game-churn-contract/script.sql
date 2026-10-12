-- Inspect event receipts before constructing the observed play stream.
SELECT ingest_id, event_id, player_id, kind FROM game_events ORDER BY ingest_id;
