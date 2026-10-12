SELECT DISTINCT m.member_id,DATE_TRUNC('month',o.placed_at AT TIME ZONE 'UTC')::date::text AS month
FROM members m
JOIN orders o ON o.member_id=m.member_id
WHERE o.status='paid' AND o.placed_at < TIMESTAMPTZ '2025-04-01 00:00+00'
ORDER BY member_id,month;
