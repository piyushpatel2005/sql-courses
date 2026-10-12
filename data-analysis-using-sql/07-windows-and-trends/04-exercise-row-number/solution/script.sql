SELECT order_id,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC,
       order_id) AS queue_position
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC,
       order_id;
