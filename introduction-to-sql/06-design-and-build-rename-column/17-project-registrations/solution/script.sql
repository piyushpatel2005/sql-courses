CREATE TABLE registrations (
  person_id integer REFERENCES people(person_id),
  workshop_id integer REFERENCES workshops(workshop_id),
  PRIMARY KEY (person_id, workshop_id)
);
INSERT INTO registrations (person_id, workshop_id)
VALUES (1,10), (1,20), (2,10);
SELECT p.name AS person, w.title AS workshop
FROM people AS p
JOIN registrations AS r ON r.person_id = p.person_id
JOIN workshops AS w ON w.workshop_id = r.workshop_id
ORDER BY p.person_id, w.workshop_id;
