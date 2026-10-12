SELECT member_id,
       ROUND(AVG(amount),
       2) AS average_order
FROM orders
WHERE status = 'paid'
GROUP BY member_id
ORDER BY member_id;
