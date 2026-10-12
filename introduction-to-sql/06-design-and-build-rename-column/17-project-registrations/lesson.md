---
title: 'Project: connect people to workshops'
slug: project-registrations
order: 17
language: sql
runtime: sql
lesson_type: coding
summary: Create registrations with person_id referencing people(person_id), workshop_id referencing workshops(workshop_id), and PRIMARY KEY (person_id, workshop_id). Insert pairs (1,10), (1,20), (2,10). Return person name as `person` and workshop title as `workshop`, ordered by person_id and workshop_id.
seo_title: 'Project: connect people to workshops | Introduction to SQL'
seo_description: Create registrations with person_id referencing people(person_id), workshop_id referencing workshops(workshop_id), and PRIMARY KEY (person_id, workshop_id). Insert pairs (1,10), (1,20), (2,10). Return person name as `person` and workshop title as `workshop`, ordered by person_id and workshop_id.
seo_keywords:
- SQL
- PostgreSQL
- project registrations
hints:
- The link table has two foreign keys and one composite primary key.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - person
  - workshop
  expected_row_count: 3
  expected_rows:
  - - Sana
    - Bike repair
  - - Sana
    - Seed saving
  - - Tomas
    - Bike repair
---

# Project: connect people to workshops

Both completed catalogs are restored. Sana will register for both workshops, while Tomas will register for Bike repair. A person can choose several workshops and a workshop can have several people, so this is a many-to-many relationship.

Create a registrations link table instead of repeating names and titles. The pair `(person_id, workshop_id)` is its primary key, which makes both values mandatory and prevents duplicate registrations for the same pair. Each key also references its parent table.

Finish by joining the three tables into an attendance list. This is the same reporting pattern you practiced in the link-table exercise, now applied to a schema you have built yourself. Keep the final ordering by person identifier and then workshop identifier so a report reader can follow one person's choices.

The result comparison does not enforce the schema for you. Check both REFERENCES clauses and the composite primary key before finishing. You now have a register that can add a person, a workshop, or a registration without copying unrelated facts.

## Restored starting state

This read-only setup runs before your SQL. Add only the new stage in `script.sql`.

```sql
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
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Create registrations with person_id referencing people(person_id), workshop_id referencing workshops(workshop_id), and PRIMARY KEY (person_id, workshop_id). Insert pairs (1,10), (1,20), (2,10). Return person name as `person` and workshop title as `workshop`, ordered by person_id and workshop_id.

## Result to aim for

| person | workshop |
| --- | --- |
| Sana | Bike repair |
| Sana | Seed saving |
| Tomas | Bike repair |
