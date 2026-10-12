SELECT name
FROM gear
WHERE available = true AND (category = 'repair' OR category = 'outdoors')
ORDER BY gear_id;
