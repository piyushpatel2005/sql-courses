CREATE OR REPLACE VIEW quarter_paid AS
SELECT order_id, member_id, placed_at, amount AS gross
FROM orders
WHERE status='paid'
 AND placed_at >= TIMESTAMPTZ '2025-01-01 00:00+00'
 AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00';
SELECT order_id, member_id, gross FROM quarter_paid ORDER BY order_id;

CREATE OR REPLACE VIEW quarter_net AS
WITH refund_totals AS (
 SELECT order_id, SUM(amount) AS refunded
 FROM refunds WHERE refunded_at < TIMESTAMPTZ '2025-04-01 00:00+00'
 GROUP BY order_id
)
SELECT p.order_id, p.member_id, p.placed_at, p.gross,
 COALESCE(r.refunded,0) AS refunded,
 p.gross-COALESCE(r.refunded,0) AS net
FROM quarter_paid p LEFT JOIN refund_totals r ON r.order_id=p.order_id;
SELECT order_id, gross, refunded, net FROM quarter_net ORDER BY order_id;
