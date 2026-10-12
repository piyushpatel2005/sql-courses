---
title: 'Exercise: who booked each session'
slug: exercise-inner-join
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Attach a person's name to each matching booking.
seo_title: 'Exercise: who booked each session | Introduction to SQL'
seo_description: Attach a person's name to each matching booking.
seo_keywords:
- SQL
- PostgreSQL
- exercise inner join
hints:
- Match the foreign identifier to the person's unique key.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - session
  expected_row_count: 3
  expected_rows:
  - - Inez
    - Woodwork
  - - Inez
    - Repair
  - - Jules
    - Printing
---

# Exercise: who booked each session

A makerspace keeps people in makers and their session choices in bookings. Join the identifiers so each booking gains a readable name. Inez should appear twice because she booked two different sessions.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE makers (maker_id integer PRIMARY KEY, name text);
CREATE TABLE bookings (booking_id integer PRIMARY KEY, maker_id integer, session text);
INSERT INTO makers VALUES (1,'Inez'),(2,'Jules'),(3,'Kai');
INSERT INTO bookings VALUES (21,1,'Woodwork'),(22,1,'Repair'),(23,2,'Printing');
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return the maker `name` and booked `session` for every booking, using the maker_id relationship. Order by booking_id.

## Result to aim for

| name | session |
| --- | --- |
| Inez | Woodwork |
| Inez | Repair |
| Jules | Printing |
