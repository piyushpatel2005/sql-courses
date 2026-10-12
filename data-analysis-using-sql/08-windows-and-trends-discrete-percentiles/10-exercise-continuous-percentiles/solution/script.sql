SELECT COUNT(amount) AS measured_orders,
       ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY amount))::numeric,2) AS median_amount
FROM orders
WHERE status='paid';
