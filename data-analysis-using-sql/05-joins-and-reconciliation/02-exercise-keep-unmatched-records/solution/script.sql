SELECT o.order_id, o.member_id, COALESCE(m.region, 'unmatched') AS region
FROM orders o
LEFT JOIN members m ON m.member_id = o.member_id
WHERE o.status = 'paid'
ORDER BY o.order_id;
