SELECT member_id,
       AVG(amount) AS average_order
FROM orders
WHERE status = 'paid'
GROUP BY member_id
ORDER BY member_id;
