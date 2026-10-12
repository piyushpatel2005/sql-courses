WITH first_paid AS (
  SELECT m.member_id, MIN(o.placed_at) AS first_at
  FROM members m JOIN orders o ON o.member_id = m.member_id
  WHERE o.status = 'paid'
    AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
  GROUP BY m.member_id
)
SELECT DATE_TRUNC('month', first_at AT TIME ZONE 'UTC')::date::text AS cohort,
       COUNT(*) AS cohort_size
FROM first_paid
GROUP BY DATE_TRUNC('month', first_at AT TIME ZONE 'UTC')::date
ORDER BY cohort;
