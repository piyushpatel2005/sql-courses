WITH refund_totals AS (
  SELECT order_id, SUM(amount) AS refunded
  FROM refunds GROUP BY order_id
)
SELECT o.order_id, o.amount AS gross,
       COALESCE(r.refunded, 0) AS refunded,
       o.amount - COALESCE(r.refunded, 0) AS net
FROM orders o
LEFT JOIN refund_totals r ON r.order_id = o.order_id
WHERE o.status = 'paid'
ORDER BY o.order_id;
