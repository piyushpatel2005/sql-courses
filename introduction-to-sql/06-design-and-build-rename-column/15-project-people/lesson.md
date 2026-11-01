---
title: 'Project: build the people register'
slug: project-people
order: 15
language: sql
runtime: sql
lesson_type: coding
summary: Build people(person_id integer PRIMARY KEY, name text NOT NULL, email text NOT NULL UNIQUE). Insert (1, 'Sana', 'sana@example.test') and (2, 'Tomas', 'tomas@example.test'). Return person_id, name, email ordered by person_id.
seo_title: 'Project: build the people register | Introduction to SQL'
seo_description: Build people(person_id integer PRIMARY KEY, name text NOT NULL, email text NOT NULL UNIQUE). Insert (1, 'Sana', 'sana@example.test') and (2, 'Tomas', 'tomas@example.test'). Return person_id, name, email ordered by person_id.
seo_keywords:
- SQL
- PostgreSQL
- project people
hints:
- Create the structure before inserting its rows.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - person_id
  - name
  - email
  expected_row_count: 2
  expected_rows:
  - - 1
    - Sana
    - sana@example.test
  - - 2
    - Tomas
    - tomas@example.test
---

# Project: build the people register

A neighborhood workshop organizer needs a register that can grow beyond one event. You will build it in three stages: people, workshops, then registrations. Each stage runs independently; its seed restores the completed earlier stages so you never depend on an old browser session.

## Data model

### Exercise data

This exercise starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `people`

One row represents one person.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `person_id` · `integer` | Identifier of the person. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Person display name; not necessarily unique. | Required; cannot be `NULL`. |
| `email` · `text` | Email address for this project's one-person-per-email rule. | Unique. Required; cannot be `NULL`. |

### State for this lesson

Stage 1 starts empty. `people` is the only new target; workshops and registrations do not exist yet.

Begin with one row per person. Store the email here, not on every future registration. Names need not be unique, but this project's rule allows only one person per email address. The PRIMARY KEY identifies a person even if their name changes.

You already practiced CREATE TABLE, PRIMARY KEY, NOT NULL, UNIQUE, and INSERT. Use those tools to turn the specification below into a table and two records. This is the first stage, so the supplied database is empty. The later stages preserve these exact people and identifiers.

Submit compares the final result. It does not independently test uniqueness, null rejection, or table design. Inspect the constraints in your SQL rather than treating a green result as a complete schema review.

## Restored starting state

This read-only setup runs before your SQL. Add only the new stage in `script.sql`.

```sql
-- Stage 1 starts with an empty database.
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Build people(person_id integer PRIMARY KEY, name text NOT NULL, email text NOT NULL UNIQUE). Insert (1, 'Sana', 'sana@example.test') and (2, 'Tomas', 'tomas@example.test'). Return person_id, name, email ordered by person_id.

## Result to aim for

| person_id | name | email |
| --- | --- | --- |
| 1 | Sana | sana@example.test |
| 2 | Tomas | tomas@example.test |
