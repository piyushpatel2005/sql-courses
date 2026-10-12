---
title: 'Exercise: cancel a mistaken change'
slug: exercise-transactions
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Cancel an uncommitted change with ROLLBACK.
seo_title: 'Exercise: cancel a mistaken change | Introduction to SQL'
seo_description: Cancel an uncommitted change with ROLLBACK.
seo_keywords:
- SQL
- PostgreSQL
- exercise transactions
hints:
- Inspect the final values after the rollback, outside the transaction block.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - gear_id
  - fee
  expected_row_count: 5
  expected_rows:
  - - 1
    - 4
  - - 2
    - 12
  - - 3
    - 6
  - - 4
    - 6
  - - 5
    - 3
---

# Exercise: cancel a mistaken change

The desk is trying a fee change that it does not want to keep. Start a transaction, make the trial update, and cancel it before inspecting the fees.

The final state proves the original values are present, not that a rollback was the only way to obtain them. Use the requested transaction steps for the practice.

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

1. Begin a transaction, set gear_id 2 fee to 99, then roll back the transaction. Return gear_id and fee for all rows ordered by gear_id.

## Result to aim for

| gear_id | fee |
| --- | --- |
| 1 | 4 |
| 2 | 12 |
| 3 | 6 |
| 4 | 6 |
| 5 | 3 |
