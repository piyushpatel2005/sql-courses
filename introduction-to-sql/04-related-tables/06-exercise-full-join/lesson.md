---
title: 'Exercise: two attendance sheets'
slug: exercise-full-join
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Compare two lists while retaining keys missing on either side.
seo_title: 'Exercise: two attendance sheets | Introduction to SQL'
seo_description: Compare two lists while retaining keys missing on either side.
seo_keywords:
- SQL
- PostgreSQL
- exercise full join
hints:
- Keep both identifiers visible so each missing partner can be recognized.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - signed_id
  - arrived_id
  expected_row_count: 3
  expected_rows:
  - - 10
    - null
  - - 20
    - 20
  - - null
    - 30
---

# Exercise: two attendance sheets

A signup sheet and an arrival sheet disagree. Keep identifiers from both sides so the coordinator can see signups that did not arrive and arrivals that never signed up. Do not discard those differences with an inner join.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE signup (person_id integer PRIMARY KEY);
CREATE TABLE arrival (person_id integer PRIMARY KEY);
INSERT INTO signup VALUES (10),(20);
INSERT INTO arrival VALUES (20),(30);
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Reconcile signup and arrival with FULL JOIN on person_id. Return `signed_id` and `arrived_id`; sort by signup person_id NULLS LAST, then arrival person_id.

## Result to aim for

| signed_id | arrived_id |
| --- | --- |
| 10 | NULL |
| 20 | 20 |
| NULL | 30 |
