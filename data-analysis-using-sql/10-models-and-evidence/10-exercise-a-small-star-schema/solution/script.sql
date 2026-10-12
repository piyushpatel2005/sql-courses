BEGIN;
CREATE TABLE fact_paid_orders (
 order_id integer PRIMARY KEY,
 member_id integer REFERENCES members(member_id),
 gross numeric(10,2)
);
INSERT INTO fact_paid_orders (order_id, member_id, gross)
SELECT o.order_id, o.member_id, o.amount
FROM orders o JOIN members m ON m.member_id = o.member_id
WHERE o.status = 'paid';
COMMIT;
SELECT member_id, COUNT(*) AS paid_orders, SUM(gross) AS gross
FROM fact_paid_orders GROUP BY member_id ORDER BY member_id;
