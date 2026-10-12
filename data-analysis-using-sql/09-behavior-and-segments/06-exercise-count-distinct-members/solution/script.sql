SELECT COUNT(DISTINCT m.member_id) AS registered_buyers
FROM members m
JOIN orders o ON o.member_id=m.member_id
WHERE o.status='paid' AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00';
