SELECT order_id,
       (placed_at AT TIME ZONE 'America/New_York')::date::text AS local_day
FROM orders
WHERE status = 'paid'
ORDER BY order_id;
