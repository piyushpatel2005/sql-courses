SELECT m.member_id, m.region
FROM members m
WHERE NOT EXISTS (
  SELECT 1 FROM orders o
  WHERE o.member_id = m.member_id AND o.status = 'paid'
)
ORDER BY m.member_id;
