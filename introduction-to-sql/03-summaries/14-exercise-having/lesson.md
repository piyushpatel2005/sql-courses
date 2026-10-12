---
title: 'Exercise: categories with enough stock'
slug: exercise-having
order: 14
language: sql
runtime: sql
lesson_type: coding
summary: Keep groups that satisfy an aggregate condition.
seo_title: 'Exercise: categories with enough stock | Introduction to SQL'
seo_description: Keep groups that satisfy an aggregate condition.
seo_keywords:
- SQL
- PostgreSQL
- exercise having
hints:
- Test COUNT(*) in HAVING after the groups exist.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - category
  - item_count
  expected_row_count: 2
  expected_rows:
  - - outdoors
    - 2
  - - repair
    - 2
---

# Exercise: categories with enough stock

A category with only one item is too small for the planned display. Count the items in each category before deciding which categories qualify. Filtering individual rows by fee would answer a different question.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE gear (
  gear_id integer PRIMARY KEY,
  name text NOT NULL,
  category text NOT NULL,
  fee numeric(6,2) NOT NULL,
  available boolean NOT NULL,
  note text
);
INSERT INTO gear VALUES
  (1, 'Hand drill', 'repair', 4.00, true, NULL),
  (2, 'Tent', 'outdoors', 12.00, true, 'Dry before return'),
  (3, 'Saw', 'repair', 6.00, false, 'New blade'),
  (4, 'Camp stove', 'outdoors', 6.00, true, NULL),
  (5, 'Brush kit', 'art', 3.00, false, 'Wash bristles');
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return `category` and `COUNT(*) AS item_count` for categories containing at least two gear rows. Order by category.

## Result to aim for

| category | item_count |
| --- | --- |
| outdoors | 2 |
| repair | 2 |
