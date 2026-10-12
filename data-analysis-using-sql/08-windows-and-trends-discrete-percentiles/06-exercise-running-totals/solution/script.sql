SELECT order_id,member_id,amount,SUM(amount) OVER (PARTITION BY member_id
ORDER BY placed_at,order_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_gross
FROM orders
WHERE status='paid'
ORDER BY member_id,placed_at,order_id;
