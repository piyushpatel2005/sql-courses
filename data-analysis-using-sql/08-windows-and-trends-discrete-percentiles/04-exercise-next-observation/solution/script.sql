SELECT order_id,member_id,amount,LEAD(amount) OVER (PARTITION BY member_id
ORDER BY placed_at,order_id) AS next_amount
FROM orders
WHERE status='paid'
ORDER BY member_id,placed_at,order_id;
