CREATE TABLE lockers (locker_id integer PRIMARY KEY,
       label text NOT NULL UNIQUE);
SELECT locker_id,
       label
FROM lockers;
