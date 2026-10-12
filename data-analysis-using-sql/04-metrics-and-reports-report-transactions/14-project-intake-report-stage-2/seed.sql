SET TIME ZONE 'UTC';
CREATE TABLE members (
  member_id integer PRIMARY KEY, region text,
  joined_on date NOT NULL, channel text
);
INSERT INTO members VALUES
 (1,'North','2025-01-03','referral'),
 (2,'South','2025-01-15','search'),
 (3,'North','2025-02-01','search'),
 (4,'West','2025-02-20',NULL),
 (5,'South','2025-03-01','referral'),
 (6,'West','2025-03-31','search');
CREATE TABLE orders (
  order_id integer PRIMARY KEY, member_id integer,
  placed_at timestamptz NOT NULL, status text NOT NULL,
  amount numeric(10,2), coupon text
);
INSERT INTO orders VALUES
 (101,1,'2025-01-05 10:00+00','paid',40,'WELCOME'),
 (102,2,'2025-01-31 23:30+00','paid',60,NULL),
 (103,1,'2025-02-01 00:00+00','paid',40,NULL),
 (104,3,'2025-02-10 12:00+00','paid',80,'FIX'),
 (105,2,'2025-02-15 09:00+00','cancelled',25,NULL),
 (106,4,'2025-02-28 23:59:59+00','paid',20,NULL),
 (107,1,'2025-03-01 00:00+00','paid',100,'FIX'),
 (108,3,'2025-03-02 16:00+00','paid',80,NULL),
 (109,5,'2025-03-02 17:00+00','paid',30,NULL),
 (110,99,'2025-03-03 12:00+00','paid',50,NULL),
 (111,5,'2025-03-04 12:00+00','pending',NULL,NULL),
 (112,2,'2025-04-01 00:00+00','paid',70,NULL),
 (113,1,'2025-03-05 12:00+00','paid',10,NULL);
CREATE TABLE order_lines (
 line_id integer PRIMARY KEY, order_id integer, units integer,
 category text, line_amount numeric(10,2)
);
INSERT INTO order_lines VALUES
 (1,101,1,'parts',25),(2,101,1,'labor',15),
 (3,102,2,'parts',60),(4,103,1,'labor',40),
 (5,104,2,'parts',50),(6,104,1,'labor',30),
 (7,106,1,'labor',20),(8,107,2,'parts',70),
 (9,107,1,'labor',30),(10,108,2,'parts',78),
 (11,109,1,'parts',30),(12,110,1,'labor',50),
 (13,112,1,'labor',70),(14,113,1,'parts',10);
CREATE TABLE refunds (
 refund_id integer PRIMARY KEY, order_id integer,
 refunded_at timestamptz, amount numeric(10,2)
);
INSERT INTO refunds VALUES
 (1,101,'2025-01-07 12:00+00',5),
 (2,101,'2025-01-08 12:00+00',3),
 (3,104,'2025-02-12 12:00+00',10),
 (4,107,'2025-03-05 12:00+00',20);
CREATE TABLE raw_intake (
 import_id integer PRIMARY KEY, member_key text,
 region_text text, fee_text text
);
INSERT INTO raw_intake VALUES
 (1,'A7',' north ','12.50'),(2,'B8','SOUTH',''),
 (3,'A7','North','12.50'),(4,'C9','   ','oops'),
 (5,'D2',NULL,'0'),(6,'E3',' west ','18.00');
CREATE TABLE events (
 ingest_id integer PRIMARY KEY, event_id text, member_id integer,
 kind text, happened_at timestamptz, received_at timestamptz
);
INSERT INTO events VALUES
 (1,'e1',1,'visit','2025-01-03 09:00+00','2025-01-03 09:01+00'),
 (2,'e2',1,'book','2025-01-03 10:00+00','2025-01-03 10:01+00'),
 (3,'e3',1,'pay','2025-01-05 10:00+00','2025-01-05 10:01+00'),
 (4,'e3',1,'pay','2025-01-05 10:00+00','2025-01-05 10:02+00'),
 (5,'e4',2,'pay','2025-01-15 08:00+00','2025-01-15 08:01+00'),
 (6,'e5',2,'visit','2025-01-15 09:00+00','2025-01-15 09:01+00'),
 (7,'e6',2,'book','2025-01-15 10:00+00','2025-01-15 10:01+00'),
 (8,'e7',3,'visit','2025-02-01 09:00+00','2025-02-01 09:01+00'),
 (9,'e8',3,'book','2025-02-01 10:00+00','2025-02-01 10:01+00'),
 (10,'e9',3,'pay','2025-02-10 12:00+00','2025-02-10 12:01+00'),
 (11,'e10',4,'visit','2025-02-20 09:00+00','2025-02-20 09:01+00'),
 (12,'e11',4,'book','2025-02-20 09:00+00','2025-02-20 09:01+00'),
 (13,'e12',4,'pay','2025-02-21 12:00+00','2025-02-21 12:01+00'),
 (14,'e13',5,'visit','2025-03-05 09:00+00','2025-03-05 09:01+00'),
 (15,'e14',5,'book','2025-03-06 09:00+00','2025-03-06 09:01+00'),
 (16,'e15',5,'pay','2025-03-25 09:00+00','2025-03-25 09:01+00'),
 (17,'e16',6,'visit','2025-03-18 12:00+00','2025-03-18 12:01+00');


CREATE OR REPLACE VIEW intake_clean AS SELECT import_id, member_key, NULLIF(LOWER(TRIM(region_text)), '') AS region, CASE WHEN TRIM(fee_text) ~ '^[0-9]+([.][0-9]+)?$' THEN TRIM(fee_text)::numeric ELSE NULL END AS fee FROM raw_intake;
