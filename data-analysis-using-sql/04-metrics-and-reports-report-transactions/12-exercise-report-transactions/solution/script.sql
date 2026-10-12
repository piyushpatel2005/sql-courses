BEGIN;
CREATE OR REPLACE VIEW paid_order_view AS SELECT order_id,
       member_id,
       amount AS gross
FROM orders
WHERE status = 'paid';
COMMIT;
SELECT order_id,
       member_id,
       gross
FROM paid_order_view
ORDER BY order_id;
