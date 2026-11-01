CREATE OR REPLACE VIEW quarter_paid AS
SELECT order_id, member_id, placed_at, amount AS gross
FROM orders
WHERE status='paid'
 AND placed_at >= TIMESTAMPTZ '2025-01-01 00:00+00'
 AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00';
SELECT order_id, member_id, gross FROM quarter_paid ORDER BY order_id;

-- TODO: Step 1: Replace the following preview: Define quarter_net using only pre-cutoff refund totals.
SELECT order_id, member_id, gross FROM quarter_paid ORDER BY order_id;
