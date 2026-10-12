CREATE TABLE sales (sale_id integer PRIMARY KEY, stall text, amount numeric(8,2), voucher text);
INSERT INTO sales VALUES (1,'East',8,'A'),(2,'East',12,NULL),(3,'West',5,NULL),(4,'West',15,'B'),(5,'North',7,NULL);

INSERT INTO sales VALUES (6,'East',12,NULL);
