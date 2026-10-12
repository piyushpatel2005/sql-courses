SELECT member_id,
       COUNT(*) AS submitted,
       COUNT(*) FILTER (WHERE status = 'paid') AS paid,
       ROUND(100.0 * COUNT(*) FILTER (WHERE status = 'paid') / NULLIF(COUNT(*),0),2) AS paid_pct
FROM orders
GROUP BY member_id
ORDER BY member_id;
