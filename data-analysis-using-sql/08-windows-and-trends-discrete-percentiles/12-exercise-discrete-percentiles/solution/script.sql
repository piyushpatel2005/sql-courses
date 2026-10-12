SELECT COUNT(amount) AS measured_orders,
       ROUND((PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY amount))::numeric,2) AS observed_median
FROM orders
WHERE status='paid';
