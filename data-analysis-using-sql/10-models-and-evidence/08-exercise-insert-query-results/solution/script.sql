INSERT INTO report_orders(order_id,gross) SELECT order_id,amount
FROM orders
WHERE status='paid';
SELECT order_id,gross
FROM report_orders
ORDER BY order_id;
