SELECT m.member_id,COALESCE(SUM(o.amount),0) AS monetary
FROM members m
LEFT JOIN orders o ON o.member_id=m.member_id AND o.status='paid' AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
GROUP BY m.member_id
ORDER BY m.member_id;
