SELECT COUNT(*) AS orders_seen, COUNT(amount) AS known_amounts,
       COUNT(*) - COUNT(amount) AS missing_amounts
FROM orders;
