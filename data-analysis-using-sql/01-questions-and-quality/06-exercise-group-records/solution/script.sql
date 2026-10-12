SELECT member_key,COUNT(*) AS copies
FROM raw_intake
GROUP BY member_key
ORDER BY member_key;
