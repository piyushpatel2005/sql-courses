---
title: 'Exercise: a mentor directory'
slug: exercise-self-join
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Read one table as both person and mentor.
seo_title: 'Exercise: a mentor directory | Introduction to SQL'
seo_description: Read one table as both person and mentor.
seo_keywords:
- SQL
- PostgreSQL
- exercise self cross joins
hints:
- Use a different alias for each role, and preserve the person with LEFT JOIN.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - mentor
  expected_row_count: 3
  expected_rows:
  - - Leena
    - null
  - - Moss
    - Leena
  - - Nuri
    - Leena
---

# Exercise: a mentor directory

A volunteer can mentor another volunteer, so both roles come from the same table. Use distinct aliases for the person and the mentor. Leena has no mentor and must still appear in the directory.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE volunteers (volunteer_id integer PRIMARY KEY, name text, mentor_id integer);
INSERT INTO volunteers VALUES (1,'Leena',NULL),(2,'Moss',1),(3,'Nuri',1);
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return every volunteer `name` and their mentor name as `mentor`, preserving volunteers without mentors. Order by the volunteer_id of the person being listed.

## Result to aim for

| name | mentor |
| --- | --- |
| Leena | NULL |
| Moss | Leena |
| Nuri | Leena |
