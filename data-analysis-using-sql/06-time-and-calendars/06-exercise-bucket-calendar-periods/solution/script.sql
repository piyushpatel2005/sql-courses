SELECT DATE_TRUNC('month', placed_at AT TIME ZONE 'UTC')::date::text AS month,
       COUNT(*) AS paid_orders, SUM(amount) AS gross
FROM orders
WHERE status = 'paid'
  AND placed_at >= TIMESTAMPTZ '2025-01-01 00:00+00'
  AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
GROUP BY DATE_TRUNC('month', placed_at AT TIME ZONE 'UTC')::date
ORDER BY month;
