SELECT name,fee
FROM gear
WHERE fee > (SELECT AVG(fee)
FROM gear)
ORDER BY gear_id;
