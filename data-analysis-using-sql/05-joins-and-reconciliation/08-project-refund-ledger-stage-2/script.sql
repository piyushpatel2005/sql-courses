CREATE OR REPLACE VIEW refund_by_order AS
SELECT order_id, SUM(amount) AS refunded
FROM refunds GROUP BY order_id;
SELECT order_id, refunded FROM refund_by_order ORDER BY order_id;

-- Stage 2: replace this preview with the next report step.
SELECT * FROM refund_by_order ORDER BY order_id;
