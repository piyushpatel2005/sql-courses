SELECT member_id,
       MAX(amount) AS largest_order
FROM orders
WHERE status = 'paid'
GROUP BY member_id
ORDER BY member_id;
