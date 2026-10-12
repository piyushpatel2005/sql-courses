CREATE TABLE lockers (locker_id integer PRIMARY KEY,
       slots integer NOT NULL CHECK (slots > 0));
SELECT locker_id,
       slots
FROM lockers;
