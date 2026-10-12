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

CREATE OR REPLACE VIEW march_trend AS
SELECT day, gross,
 SUM(gross) OVER (ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_gross,
 SUM(gross) OVER (ORDER BY day ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS trailing_three_days
FROM march_daily;
SELECT day::text AS day, gross, running_gross, trailing_three_days
FROM march_trend ORDER BY day;

WITH changes AS (
 SELECT *, LAG(gross) OVER (ORDER BY day) AS previous_gross
 FROM march_trend
)
SELECT day::text AS day, gross, running_gross, trailing_three_days,
 gross - previous_gross AS change_amount,
 ROUND(100.0 * (gross - previous_gross)
       / NULLIF(previous_gross,0), 2) AS change_pct
FROM changes ORDER BY day;
