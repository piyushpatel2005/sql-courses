SELECT order_id, member_id, amount,
       SUM(amount) OVER (PARTITION BY member_id) AS member_gross,
       ROUND(100.0 * amount / NULLIF(
         SUM(amount) OVER (PARTITION BY member_id), 0), 2) AS share_pct
FROM orders WHERE status = 'paid'
ORDER BY member_id, order_id;
