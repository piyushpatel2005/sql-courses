CREATE INDEX orders_placed_at_idx ON orders(placed_at);
SELECT order_id,amount
FROM orders
WHERE status='paid' AND placed_at >= TIMESTAMPTZ '2025-03-01 00:00+00' AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
ORDER BY order_id;
