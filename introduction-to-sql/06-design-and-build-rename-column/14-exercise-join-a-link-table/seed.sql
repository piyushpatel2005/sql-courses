CREATE TABLE participants (participant_id integer PRIMARY KEY, name text);
CREATE TABLE sessions (session_id integer PRIMARY KEY, title text);
CREATE TABLE enrollments (participant_id integer REFERENCES participants, session_id integer REFERENCES sessions, PRIMARY KEY(participant_id,session_id));
INSERT INTO participants VALUES (1,'Ada'),(2,'Ravi');
INSERT INTO sessions VALUES (10,'Weaving'),(20,'Repair');
INSERT INTO enrollments VALUES (1,10),(1,20),(2,20);
