SELECT order_id,
       amount,
       RANK() OVER (ORDER BY amount DESC) AS amount_rank
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC,
       order_id;
