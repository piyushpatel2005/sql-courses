SELECT name,category
FROM gear
WHERE category IN (SELECT category
FROM gear
WHERE fee >= 10)
ORDER BY gear_id;
