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
