SET TIME ZONE 'UTC';
CREATE TABLE members (member_id integer PRIMARY KEY, region text, joined_on date, channel text);
INSERT INTO members VALUES
 (21,'East','2024-12-20','referral'),(22,'East','2025-01-02','search'),
 (23,'Lake','2025-01-10','search'),(24,'Lake','2025-02-01','referral'),
 (25,'Hill','2025-03-01',NULL),(26,'Hill','2025-03-20','search');
CREATE TABLE orders (order_id integer PRIMARY KEY, member_id integer,
 placed_at timestamptz, status text, amount numeric(10,2), coupon text);
INSERT INTO orders VALUES
 (201,21,'2024-12-31 23:59:59+00','paid',90,NULL),
 (202,21,'2025-01-01 00:00+00','paid',120,NULL),
 (203,22,'2025-01-15 12:00+00','paid',60,'START'),
 (204,23,'2025-01-31 23:59:59+00','paid',60,NULL),
 (205,21,'2025-02-01 00:00+00','paid',80,NULL),
 (206,24,'2025-02-05 12:00+00','paid',40,NULL),
 (207,22,'2025-02-06 12:00+00','cancelled',100,NULL),
 (208,23,'2025-03-01 00:00+00','paid',100,NULL),
 (209,25,'2025-03-10 12:00+00','paid',30,NULL),
 (210,999,'2025-03-11 12:00+00','paid',50,NULL),
 (211,26,'2025-03-21 12:00+00','pending',NULL,NULL),
 (212,21,'2025-04-01 00:00+00','paid',200,NULL);
CREATE TABLE refunds (refund_id integer PRIMARY KEY, order_id integer,
 refunded_at timestamptz, amount numeric(10,2));
INSERT INTO refunds VALUES
 (21,202,'2025-01-04 12:00+00',10),
 (22,202,'2025-01-05 12:00+00',5),
 (23,204,'2025-02-02 12:00+00',10),
 (24,208,'2025-03-15 12:00+00',20),
 (25,205,'2025-04-02 12:00+00',30);


CREATE OR REPLACE VIEW quarter_paid AS
SELECT order_id, member_id, placed_at, amount AS gross
FROM orders
WHERE status='paid'
 AND placed_at >= TIMESTAMPTZ '2025-01-01 00:00+00'
 AND placed_at < TIMESTAMPTZ '2025-04-01 00:00+00';
CREATE OR REPLACE VIEW quarter_net AS
WITH refund_totals AS (
 SELECT order_id, SUM(amount) AS refunded
 FROM refunds WHERE refunded_at < TIMESTAMPTZ '2025-04-01 00:00+00'
 GROUP BY order_id
)
SELECT p.order_id, p.member_id, p.placed_at, p.gross,
 COALESCE(r.refunded,0) AS refunded,
 p.gross-COALESCE(r.refunded,0) AS net
FROM quarter_paid p LEFT JOIN refund_totals r ON r.order_id=p.order_id;
