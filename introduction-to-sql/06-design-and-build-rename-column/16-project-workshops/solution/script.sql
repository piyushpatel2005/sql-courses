CREATE TABLE workshops (
  workshop_id integer PRIMARY KEY,
  title text NOT NULL,
  seats integer NOT NULL CHECK (seats > 0)
);
INSERT INTO workshops (workshop_id, title, seats)
VALUES (10, 'Bike repair', 3), (20, 'Seed saving', 2);
SELECT workshop_id, title, seats FROM workshops ORDER BY workshop_id;
