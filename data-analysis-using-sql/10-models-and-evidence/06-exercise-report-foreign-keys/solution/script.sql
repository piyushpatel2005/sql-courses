CREATE TABLE report_orders(order_id integer PRIMARY KEY,member_id integer REFERENCES members(member_id));
SELECT order_id,member_id
FROM report_orders;
