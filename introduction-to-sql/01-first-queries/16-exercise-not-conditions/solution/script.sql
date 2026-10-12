SELECT name
FROM gear
WHERE NOT (available = true)
ORDER BY gear_id;
