SELECT order_id,member_id,amount,SUM(amount) OVER (PARTITION BY member_id
ORDER BY placed_at,order_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS trailing_three_orders
FROM orders
WHERE status='paid'
ORDER BY member_id,placed_at,order_id;
