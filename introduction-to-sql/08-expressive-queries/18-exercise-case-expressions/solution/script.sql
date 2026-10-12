SELECT name,
       CASE WHEN available THEN 'ready' ELSE 'unavailable' END AS status
FROM gear
ORDER BY gear_id;
