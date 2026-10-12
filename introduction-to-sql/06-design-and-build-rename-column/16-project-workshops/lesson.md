---
title: 'Project: add the workshop catalog'
slug: project-workshops
order: 16
language: sql
runtime: sql
lesson_type: coding
summary: Build workshops(workshop_id integer PRIMARY KEY, title text NOT NULL, seats integer NOT NULL CHECK (seats > 0)). Insert (10, 'Bike repair', 3) and (20, 'Seed saving', 2). Return workshop_id, title, seats ordered by workshop_id.
seo_title: 'Project: add the workshop catalog | Introduction to SQL'
seo_description: Build workshops(workshop_id integer PRIMARY KEY, title text NOT NULL, seats integer NOT NULL CHECK (seats > 0)). Insert (10, 'Bike repair', 3) and (20, 'Seed saving', 2). Return workshop_id, title, seats ordered by workshop_id.
seo_keywords:
- SQL
- PostgreSQL
- project workshops
hints:
- CHECK describes one row; seats must be positive.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - workshop_id
  - title
  - seats
  expected_row_count: 2
  expected_rows:
  - - 10
    - Bike repair
    - 3
  - - 20
    - Seed saving
    - 2
---

# Project: add the workshop catalog

The people register from stage 1 is restored with Sana and Tomas unchanged. Now add the independent catalog of workshops. A workshop exists even before someone registers, so it should not be stored as a repeated field on a person.

Use one row per workshop, with a positive seat capacity. The CHECK controls the declared capacity; it does not count registrations or prevent overbooking by itself. That rule would require additional transactional application logic, which is beyond this modeling project.

The seed is the completed SQL from stage 1. Do not recreate or rename people. Add your new table and rows, then inspect the catalog. In stage 3 these exact workshop identifiers will become foreign-key targets.

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
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Build workshops(workshop_id integer PRIMARY KEY, title text NOT NULL, seats integer NOT NULL CHECK (seats > 0)). Insert (10, 'Bike repair', 3) and (20, 'Seed saving', 2). Return workshop_id, title, seats ordered by workshop_id.

## Result to aim for

| workshop_id | title | seats |
| --- | --- | --- |
| 10 | Bike repair | 3 |
| 20 | Seed saving | 2 |
