CREATE TABLE members (member_id integer PRIMARY KEY, name text);
CREATE TABLE loans (loan_id integer PRIMARY KEY, member_id integer, title text);
INSERT INTO members VALUES (1,'Asha'),(2,'Bo'),(3,'Cleo');
INSERT INTO loans VALUES (10,1,'Maps'),(11,1,'Birds'),(12,2,'Clay');
