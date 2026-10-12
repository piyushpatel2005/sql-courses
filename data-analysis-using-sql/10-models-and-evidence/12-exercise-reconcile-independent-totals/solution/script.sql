WITH paid AS (
 SELECT order_id, amount AS order_gross FROM orders WHERE status = 'paid'
), lines AS (
 SELECT order_id, SUM(line_amount) AS line_gross
 FROM order_lines GROUP BY order_id
)
SELECT COALESCE(p.order_id, l.order_id) AS order_id,
       p.order_gross, l.line_gross,
       COALESCE(p.order_gross, 0) - COALESCE(l.line_gross, 0) AS difference
FROM paid p FULL JOIN lines l ON l.order_id = p.order_id
ORDER BY order_id;
