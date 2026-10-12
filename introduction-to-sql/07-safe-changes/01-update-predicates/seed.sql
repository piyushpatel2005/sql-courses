CREATE TABLE menu (item_id integer PRIMARY KEY, item text, section text, price numeric(6,2), in_stock boolean, note text);
INSERT INTO menu VALUES
  (1,'Tea','drink',2.50,true,NULL),
  (2,'Soup','food',5.00,true,'Contains celery'),
  (3,'Cake','food',4.00,false,NULL),
  (4,'Coffee','drink',3.00,true,'Decaf available');
