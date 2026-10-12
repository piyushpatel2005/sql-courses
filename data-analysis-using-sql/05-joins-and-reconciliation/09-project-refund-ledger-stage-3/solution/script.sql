CREATE OR REPLACE VIEW refund_by_order AS
SELECT order_id, SUM(amount) AS refunded
FROM refunds GROUP BY order_id;
SELECT order_id, refunded FROM refund_by_order ORDER BY order_id;

CREATE OR REPLACE VIEW paid_ledger AS
SELECT o.order_id, o.member_id, o.amount AS gross,
       COALESCE(r.refunded, 0) AS refunded,
       o.amount - COALESCE(r.refunded, 0) AS net
FROM orders o LEFT JOIN refund_by_order r ON r.order_id = o.order_id
WHERE o.status = 'paid';
SELECT order_id, member_id, gross, refunded, net
FROM paid_ledger ORDER BY order_id;

SELECT COALESCE(m.region, 'unmatched') AS region,
       COUNT(*) AS orders, SUM(l.gross) AS gross,
       SUM(l.refunded) AS refunded, SUM(l.net) AS net
FROM paid_ledger l
LEFT JOIN members m ON m.member_id = l.member_id
GROUP BY COALESCE(m.region, 'unmatched')
ORDER BY region;
