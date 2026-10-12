CREATE TABLE people (
  person_id integer PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL UNIQUE
);
INSERT INTO people (person_id, name, email)
VALUES (1, 'Sana', 'sana@example.test'),
       (2, 'Tomas', 'tomas@example.test');
CREATE TABLE workshops (
  workshop_id integer PRIMARY KEY,
  title text NOT NULL,
  seats integer NOT NULL CHECK (seats > 0)
);
INSERT INTO workshops (workshop_id, title, seats)
VALUES (10, 'Bike repair', 3), (20, 'Seed saving', 2);
