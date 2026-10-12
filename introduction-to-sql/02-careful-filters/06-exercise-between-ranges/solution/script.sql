SELECT name,
       fee
FROM gear
WHERE fee BETWEEN 4 AND 6
ORDER BY gear_id;
