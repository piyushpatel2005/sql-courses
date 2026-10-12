SELECT m.member_id,DATE '2025-04-01'-MAX((o.placed_at AT TIME ZONE 'UTC')::date) AS recency_days
FROM members m
LEFT JOIN orders o ON o.member_id=m.member_id AND o.status='paid' AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
GROUP BY m.member_id
ORDER BY m.member_id;
