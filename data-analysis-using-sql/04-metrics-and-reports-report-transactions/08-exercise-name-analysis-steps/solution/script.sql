WITH totals AS (
  SELECT member_id, SUM(amount) AS gross
  FROM orders WHERE status = 'paid'
  GROUP BY member_id
)
SELECT member_id, gross,
       CASE WHEN gross >= 150 THEN 'high' ELSE 'standard' END AS band
FROM totals
ORDER BY member_id;
