---
title: 'Exercise: retire one kit'
slug: exercise-delete-predicates
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Retire one record without dropping its table.
seo_title: 'Exercise: retire one kit | Introduction to SQL'
seo_description: Retire one record without dropping its table.
seo_keywords:
- SQL
- PostgreSQL
- exercise delete predicates
hints:
- DELETE with a primary-key predicate limits which row is removed.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - gear_id
  - name
  expected_row_count: 4
  expected_rows:
  - - 1
    - Hand drill
  - - 2
    - Tent
  - - 3
    - Saw
  - - 4
    - Camp stove
---

# Exercise: retire one kit

The Brush kit has been retired. Remove its row while preserving the gear table and all other equipment. Use its identifier so another item with a similar name would not be removed accidentally.

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

1. Delete only gear_id 5. Return gear_id and name for all remaining gear, ordered by gear_id.

## Result to aim for

| gear_id | name |
| --- | --- |
| 1 | Hand drill |
| 2 | Tent |
| 3 | Saw |
| 4 | Camp stove |
