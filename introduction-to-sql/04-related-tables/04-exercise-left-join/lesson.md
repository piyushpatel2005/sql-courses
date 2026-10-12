---
title: 'Exercise: makers with no bookings'
slug: exercise-left-join
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Keep people whose related booking is missing.
seo_title: 'Exercise: makers with no bookings | Introduction to SQL'
seo_description: Keep people whose related booking is missing.
seo_keywords:
- SQL
- PostgreSQL
- exercise left join
hints:
- Test the right-side booking key for NULL after the left join.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 1
  expected_rows:
  - - Kai
---

# Exercise: makers with no bookings

The makerspace wants to contact people who have not booked anything. Begin with all makers and preserve those without a partner row. Test the booking primary key, not a nullable descriptive field, to identify the missing partner.

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

1. Return maker `name` only for makers with no matching booking. Use a LEFT JOIN and a NULL test on booking_id. Order by maker_id.

## Result to aim for

| name |
| --- |
| Kai |
