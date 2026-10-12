SELECT category,total_fee
FROM (SELECT category,SUM(fee) AS total_fee
FROM gear
GROUP BY category) AS totals
WHERE total_fee >= 10
ORDER BY category;
