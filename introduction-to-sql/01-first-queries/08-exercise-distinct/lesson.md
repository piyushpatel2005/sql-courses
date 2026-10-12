---
title: 'Exercise: the category menu'
slug: exercise-distinct
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Build a category list without repeated result rows.
seo_title: 'Exercise: the category menu | Introduction to SQL'
seo_description: Build a category list without repeated result rows.
seo_keywords:
- SQL
- PostgreSQL
- exercise distinct
hints:
- DISTINCT compares all selected columns together.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - category
  expected_row_count: 3
  expected_rows:
  - - art
  - - outdoors
  - - repair
---

# Exercise: the category menu

A category picker should not list outdoors twice just because two pieces of gear belong to it. Produce the picker values from the data rather than writing a fixed list. The source rows should remain unchanged.

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

1. Return the distinct `category` values in `gear`, sorted alphabetically.

## Result to aim for

| category |
| --- |
| art |
| outdoors |
| repair |
