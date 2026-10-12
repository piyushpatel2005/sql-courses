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

CREATE OR REPLACE VIEW quarter_regions AS
SELECT COALESCE(m.region,'unmatched') AS region,
 COUNT(*) AS paid_orders, COUNT(DISTINCT m.member_id) AS registered_buyers,
 SUM(n.gross) AS gross, SUM(n.refunded) AS refunded, SUM(n.net) AS net
FROM quarter_net n LEFT JOIN members m ON m.member_id=n.member_id
GROUP BY COALESCE(m.region,'unmatched');
SELECT region, paid_orders, registered_buyers, gross, refunded, net
FROM quarter_regions ORDER BY region;

CREATE OR REPLACE VIEW quarter_months AS
WITH calendar AS (
 SELECT month::date AS month FROM GENERATE_SERIES(
  TIMESTAMP '2025-01-01', TIMESTAMP '2025-03-01', INTERVAL '1 month') AS g(month)
), totals AS (
 SELECT DATE_TRUNC('month',placed_at AT TIME ZONE 'UTC')::date AS month,
  COUNT(*) AS paid_orders, SUM(net) AS net
 FROM quarter_net
 GROUP BY DATE_TRUNC('month',placed_at AT TIME ZONE 'UTC')::date
)
SELECT c.month, COALESCE(t.paid_orders,0) AS paid_orders, COALESCE(t.net,0) AS net
FROM calendar c LEFT JOIN totals t ON t.month=c.month;
SELECT month::text AS month, paid_orders, net,
 SUM(net) OVER (ORDER BY month
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_net,
 net-LAG(net) OVER (ORDER BY month) AS change_net
FROM quarter_months ORDER BY month;

SELECT region, paid_orders, registered_buyers, net,
 ROUND(100.0 * net / NULLIF(SUM(net) OVER (),0),2) AS net_share_pct,
 DENSE_RANK() OVER (ORDER BY net DESC) AS net_rank,
 SUM(net) OVER () - (SELECT SUM(net) FROM quarter_months) AS reconciliation_gap
FROM quarter_regions ORDER BY net DESC, region;
