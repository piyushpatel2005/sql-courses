SELECT member_id,
       COUNT(*) AS submitted,
       COUNT(*) FILTER (WHERE status = 'paid') AS paid
FROM orders
GROUP BY member_id
ORDER BY member_id;
