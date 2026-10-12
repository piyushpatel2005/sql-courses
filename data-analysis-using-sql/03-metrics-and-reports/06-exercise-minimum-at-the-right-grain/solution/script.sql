SELECT member_id,
       MIN(amount) AS smallest_order
FROM orders
WHERE status = 'paid'
GROUP BY member_id
ORDER BY member_id;
