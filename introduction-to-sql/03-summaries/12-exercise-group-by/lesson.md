---
title: 'Exercise: category totals'
slug: exercise-group-by
order: 12
language: sql
runtime: sql
lesson_type: coding
summary: Make a separate summary for each category.
seo_title: 'Exercise: category totals | Introduction to SQL'
seo_description: Make a separate summary for each category.
seo_keywords:
- SQL
- PostgreSQL
- exercise group by
hints:
- Select the category key beside the aggregates and group by that key.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - category
  - item_count
  - total_fee
  expected_row_count: 3
  expected_rows:
  - - art
    - 1
    - 3
  - - outdoors
    - 2
    - 18
  - - repair
    - 2
    - 10
---

# Exercise: category totals

The coordinator needs a category-level budget summary. Decide the grain first: each category gets one row, even when several gear items belong to it. Count the items and add their fees inside those groups.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `gear`

One row represents one equipment catalog entry.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `gear_id` · `integer` | Identifier of the equipment entry. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Equipment display name. | Required; cannot be `NULL`. |
| `category` · `text` | Equipment grouping, such as repair, outdoors or art. | Required; cannot be `NULL`. |
| `fee` · `numeric(6,2)` | Daily borrowing charge in currency units, stored to two decimal places. | Required; cannot be `NULL`. |
| `available` · `boolean` | Whether the equipment is available to borrow: true or false. | Required; cannot be `NULL`. |
| `note` · `text` | Optional handling note. | Nullable; `NULL` means no note is recorded. |

Only `note` may be missing. Category labels are sample values, not an enforced vocabulary. No currency code or nonnegative-fee constraint is declared; a fee is a daily charge, not a count of items.

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

1. Return one row per `category`, with `COUNT(*) AS item_count` and `SUM(fee) AS total_fee`. Order by category.

## Result to aim for

| category | item_count | total_fee |
| --- | --- | --- |
| art | 1 | 3 |
| outdoors | 2 | 18 |
| repair | 2 | 10 |
