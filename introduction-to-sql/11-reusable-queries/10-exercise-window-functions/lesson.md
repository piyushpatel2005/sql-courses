---
title: 'Exercise: rank gear within each category'
slug: exercise-window-functions
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Number detail rows separately within each category.
seo_title: 'Exercise: rank gear within each category | Introduction to SQL'
seo_description: Number detail rows separately within each category.
seo_keywords:
- SQL
- PostgreSQL
- exercise window functions
hints:
- PARTITION BY restarts numbering; a unique window tie-breaker decides positions.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - category
  - name
  - position
  expected_row_count: 5
  expected_rows:
  - - art
    - Brush kit
    - 1
  - - outdoors
    - Tent
    - 1
  - - outdoors
    - Camp stove
    - 2
  - - repair
    - Saw
    - 1
  - - repair
    - Hand drill
    - 2
---

# Exercise: rank gear within each category

The desk wants every item listed with a position within its own category. A GROUP BY would collapse those details. Number each partition by fee, use gear_id for ties, and sort the final display separately.

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

1. Return category, name, and ROW_NUMBER as position within each category. Number by descending fee then ascending gear_id; display by category then position.

## Result to aim for

| category | name | position |
| --- | --- | --- |
| art | Brush kit | 1 |
| outdoors | Tent | 1 |
| outdoors | Camp stove | 2 |
| repair | Saw | 1 |
| repair | Hand drill | 2 |
