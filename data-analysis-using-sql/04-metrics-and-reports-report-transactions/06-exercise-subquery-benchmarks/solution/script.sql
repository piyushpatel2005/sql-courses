SELECT order_id, amount
FROM orders
WHERE status = 'paid'
  AND amount > (SELECT AVG(amount)
                FROM orders WHERE status = 'paid')
ORDER BY order_id;
