---
title: 'Exercise: summarize before filtering'
slug: exercise-common-table-expressions
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Name a summary for the duration of one statement.
seo_title: 'Exercise: summarize before filtering | Introduction to SQL'
seo_description: Name a summary for the duration of one statement.
seo_keywords:
- SQL
- PostgreSQL
- exercise common table expressions
hints:
- The outer WHERE can use a total exposed as a CTE column.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - category
  - total_fee
  expected_row_count: 2
  expected_rows:
  - - outdoors
    - 18
  - - repair
    - 10
---

# Exercise: summarize before filtering

Separate a category report into a named summary stage and a filtering stage. The outer query can refer to total_fee as an ordinary column of that named result. Keep both stages in one SQL statement.

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

### Named query result

#### `category_totals`

One row represents one category group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `category` · `text` | Grouping label from `gear.category`. | Logical group key, not a physical primary key. Required in the base table. |
| `total_fee` · `numeric` | Sum of `gear.fee` in this group, in daily borrowing currency units. | Computed value; no fixed precision or scale. Known for each nonempty group because fees are required. |

The CTE is a named result within one statement, not a preloaded table or persistent view. Its grouped label is logically unique, with NULL grouping handled as one group where allowed.

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

1. Use a CTE named category_totals to calculate SUM(fee) AS total_fee by category. Return category, total_fee only where total_fee is at least 10, ordered by category.

## Result to aim for

| category | total_fee |
| --- | --- |
| outdoors | 18 |
| repair | 10 |
