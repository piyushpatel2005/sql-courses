CREATE OR REPLACE VIEW refund_by_order AS
SELECT order_id, SUM(amount) AS refunded
FROM refunds GROUP BY order_id;
SELECT order_id, refunded FROM refund_by_order ORDER BY order_id;

-- TODO: Step 1: Replace the following preview: Define paid_ledger without losing orders with no refund.
SELECT * FROM refund_by_order ORDER BY order_id;
