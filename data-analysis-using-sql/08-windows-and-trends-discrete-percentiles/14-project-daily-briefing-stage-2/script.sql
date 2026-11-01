CREATE OR REPLACE VIEW march_daily AS
WITH calendar AS (
 SELECT day::date AS day FROM GENERATE_SERIES(
 TIMESTAMP '2025-03-01', TIMESTAMP '2025-03-05', INTERVAL '1 day') AS g(day)
), daily AS (
 SELECT (placed_at AT TIME ZONE 'UTC')::date AS day, SUM(amount) AS gross
 FROM orders WHERE status='paid'
 GROUP BY (placed_at AT TIME ZONE 'UTC')::date
)
SELECT c.day, COALESCE(d.gross,0) AS gross
FROM calendar c LEFT JOIN daily d ON d.day=c.day;
SELECT day::text AS day, gross FROM march_daily ORDER BY day;

-- TODO: Step 1: Replace the following preview: Define march_trend with running and trailing daily totals.
SELECT day::text AS day, gross FROM march_daily ORDER BY day;
