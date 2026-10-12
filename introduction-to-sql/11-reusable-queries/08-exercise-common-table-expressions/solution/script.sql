WITH category_totals AS (
  SELECT category, SUM(fee) AS total_fee
  FROM gear GROUP BY category
)
SELECT category, total_fee FROM category_totals
WHERE total_fee >= 10 ORDER BY category;
