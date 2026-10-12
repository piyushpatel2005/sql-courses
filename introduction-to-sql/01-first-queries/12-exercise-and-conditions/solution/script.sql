SELECT name
FROM gear
WHERE available = true AND fee <= 6
ORDER BY gear_id;
