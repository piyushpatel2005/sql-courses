---
title: 'Exercise: makers who have bookings'
slug: exercise-exists
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Find people with related activity without multiplying contacts.
seo_title: 'Exercise: makers who have bookings | Introduction to SQL'
seo_description: Find people with related activity without multiplying contacts.
seo_keywords:
- SQL
- PostgreSQL
- exercise exists
hints:
- Correlate the inner key with the current outer person.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Inez
  - - Jules
---

# Exercise: makers who have bookings

The makerspace needs one contact row for each maker with a booking, not one row per booking. EXISTS fits that question without producing duplicate contacts. Kai has no bookings and should not appear.

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

1. Return maker name once per maker who has at least one booking. Use correlated EXISTS and order by maker_id.

## Result to aim for

| name |
| --- |
| Inez |
| Jules |
