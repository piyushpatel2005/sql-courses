WITH activity AS (
  SELECT DISTINCT m.member_id,
    DATE_TRUNC('month', o.placed_at AT TIME ZONE 'UTC')::date AS month
  FROM members m JOIN orders o ON o.member_id = m.member_id
  WHERE o.status = 'paid'
    AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
), cohorts AS (
  SELECT member_id, MIN(month) AS cohort
  FROM activity GROUP BY member_id
)
SELECT c.cohort::text AS cohort, COUNT(*) AS cohort_size,
       COUNT(a.member_id) AS retained_month1,
       ROUND(100.0 * COUNT(a.member_id) / NULLIF(COUNT(*), 0), 2) AS retention_pct
FROM cohorts c
LEFT JOIN activity a ON a.member_id = c.member_id
 AND a.month = (c.cohort + INTERVAL '1 month')::date
WHERE c.cohort + INTERVAL '2 months' <= DATE '2025-04-01'
GROUP BY c.cohort ORDER BY c.cohort;
