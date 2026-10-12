---
title: 'Exercise: a ready gear view'
slug: exercise-views
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Give a recurring filter a reusable query name.
seo_title: 'Exercise: a ready gear view | Introduction to SQL'
seo_description: Give a recurring filter a reusable query name.
seo_keywords:
- SQL
- PostgreSQL
- exercise views
hints:
- Keep the sort key in the view even when the final display omits it.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 3
  expected_rows:
  - - Hand drill
    - 4
  - - Tent
    - 12
  - - Camp stove
    - 6
---

# Exercise: a ready gear view

The result checks do not prove that a view object was created. Include CREATE VIEW and query it as requested.

The desk repeatedly asks for available equipment. Give that filter a reusable view name, then read the view rather than repeating its WHERE clause. Keep the identifier available inside the view for stable outer ordering.

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

1. Create view ready_gear selecting gear_id, name, fee from gear where available is true. Return name and fee from that view, ordered by gear_id.

## Result to aim for

| name | fee |
| --- | --- |
| Hand drill | 4 |
| Tent | 12 |
| Camp stove | 6 |
