---
title: 'Exercise: a lending-desk list'
slug: exercise-select-columns
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Choose the columns a reader needs without changing the stored table.
seo_title: 'Exercise: a lending-desk list | Introduction to SQL'
seo_description: Choose the columns a reader needs without changing the stored table.
seo_keywords:
- SQL
- PostgreSQL
- exercise select columns
hints:
- The SELECT list controls visible columns; ORDER BY can use an unselected key.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - category
  expected_row_count: 5
  expected_rows:
  - - Hand drill
    - repair
  - - Tent
    - outdoors
  - - Saw
    - repair
  - - Camp stove
    - outdoors
  - - Brush kit
    - art
---

# Exercise: a lending-desk list

The lending desk wants a short list of what it owns. The supplied gear table has more columns than the list needs. Choose only the name and category, keeping the identifier as a sort key rather than a visible report column.

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

1. Return `name` and `category` from `gear`, in ascending `gear_id` order.

## Result to aim for

| name | category |
| --- | --- |
| Hand drill | repair |
| Tent | outdoors |
| Saw | repair |
| Camp stove | outdoors |
| Brush kit | art |
