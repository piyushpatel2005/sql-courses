WITH rfm AS (
 SELECT m.member_id,
   DATE '2025-04-01' - MAX((o.placed_at AT TIME ZONE 'UTC')::date) AS recency_days,
   COUNT(o.order_id) AS frequency,
       COALESCE(SUM(o.amount),
       0) AS monetary
FROM members m
LEFT JOIN orders o ON o.member_id = m.member_id
  AND o.status = 'paid'
  AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
GROUP BY m.member_id
)
SELECT member_id,
       recency_days,
       frequency,
       monetary,
 CASE WHEN frequency = 0 THEN 'never_bought'
      WHEN frequency >= 2 AND recency_days <= 45 THEN 'active_repeat'
      ELSE 'other' END AS segment
FROM rfm
ORDER BY member_id;
