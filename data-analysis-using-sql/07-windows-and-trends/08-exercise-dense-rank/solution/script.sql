SELECT order_id,
       amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS amount_level
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC,
       order_id;
