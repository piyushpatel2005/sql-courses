SELECT order_id,
       (placed_at AT TIME ZONE 'America/New_York')::date::text AS local_day
FROM orders
WHERE status = 'paid' AND placed_at >= TIMESTAMPTZ '2025-01-01 00:00+00' AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
ORDER BY order_id;
