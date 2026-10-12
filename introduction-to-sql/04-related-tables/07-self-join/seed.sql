CREATE TABLE staff (staff_id integer PRIMARY KEY, name text, manager_id integer);
INSERT INTO staff VALUES (1,'Eda',NULL),(2,'Finn',1);
CREATE TABLE rooms (room text);
CREATE TABLE slots (slot text);
INSERT INTO rooms VALUES ('Blue'),('Green');
INSERT INTO slots VALUES ('10:00'),('14:00');
