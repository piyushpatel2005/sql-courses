SELECT order_id, member_id, amount
FROM orders
WHERE status = 'paid'
ORDER BY order_id;
