SELECT member_key,COUNT(*) AS copies
FROM raw_intake
GROUP BY member_key
HAVING COUNT(*) > 1
ORDER BY member_key;
