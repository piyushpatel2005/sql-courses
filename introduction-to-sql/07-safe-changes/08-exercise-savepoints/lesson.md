---
title: 'Exercise: keep the correction, undo the trial'
slug: exercise-savepoints
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Keep an earlier correction while undoing a later trial.
seo_title: 'Exercise: keep the correction, undo the trial | Introduction to SQL'
seo_description: Keep an earlier correction while undoing a later trial.
seo_keywords:
- SQL
- PostgreSQL
- exercise savepoints
hints:
- Place the savepoint after the correction you want to keep.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - gear_id
  - fee
  expected_row_count: 5
  expected_rows:
  - - 1
    - 5
  - - 2
    - 12
  - - 3
    - 6
  - - 4
    - 6
  - - 5
    - 3
---

# Exercise: keep the correction, undo the trial

Keep the Hand drill correction, but discard the later Tent trial. The savepoint marks the boundary between those decisions.

Submit checks the final state, not transaction history. Follow the stated SAVEPOINT sequence even if another query could print the same values.

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

1. In one transaction, set gear_id 1 fee to 5, create SAVEPOINT corrected, set gear_id 2 fee to 50, roll back to corrected, and commit. Return gear_id and fee ordered by gear_id.

## Result to aim for

| gear_id | fee |
| --- | --- |
| 1 | 5 |
| 2 | 12 |
| 3 | 6 |
| 4 | 6 |
| 5 | 3 |
