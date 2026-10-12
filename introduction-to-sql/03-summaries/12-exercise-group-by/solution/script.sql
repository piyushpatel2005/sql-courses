SELECT category, COUNT(*) AS item_count,
       SUM(fee) AS total_fee
FROM gear
GROUP BY category
ORDER BY category;
