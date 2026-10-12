---
title: 'Exercise: repair one fee'
slug: exercise-update-predicates
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Correct one fee while leaving the other records untouched.
seo_title: 'Exercise: repair one fee | Introduction to SQL'
seo_description: Correct one fee while leaving the other records untouched.
seo_keywords:
- SQL
- PostgreSQL
- exercise update predicates
hints:
- Use the unique gear identifier in the UPDATE predicate.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - gear_id
  - name
  - fee
  expected_row_count: 5
  expected_rows:
  - - 1
    - Hand drill
    - 4
  - - 2
    - Tent
    - 12
  - - 3
    - Saw
    - 7
  - - 4
    - Camp stove
    - 6
  - - 5
    - Brush kit
    - 3
---

# Exercise: repair one fee

The daily fee for the Saw is wrong. Correct that record by its primary key, then inspect every item to make sure no unrelated fee changed. Printing only the changed row would make an overly broad update harder to notice.

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

1. Change only gear_id 3 to fee 7.00. Return gear_id, name, fee for all gear rows ordered by gear_id.

## Result to aim for

| gear_id | name | fee |
| --- | --- | --- |
| 1 | Hand drill | 4 |
| 2 | Tent | 12 |
| 3 | Saw | 7 |
| 4 | Camp stove | 6 |
| 5 | Brush kit | 3 |
