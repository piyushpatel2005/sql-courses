SELECT member_id,
       SUM(amount) AS gross
FROM orders
WHERE status = 'paid'
GROUP BY member_id
ORDER BY member_id;
