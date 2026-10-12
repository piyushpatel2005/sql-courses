WITH ranked AS (
 SELECT order_id,amount,DENSE_RANK() OVER (ORDER BY amount DESC) AS amount_level
 FROM orders WHERE status='paid'
)
SELECT order_id,amount,amount_level FROM ranked
WHERE amount_level <= 2 ORDER BY amount DESC,order_id;
