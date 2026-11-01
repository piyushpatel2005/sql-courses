---
title: 'Exercise: Select an inclusive range with BETWEEN'
slug: exercise-between-ranges
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Select a numeric range that includes both endpoints.
seo_title: 'Exercise: Select an inclusive range with BETWEEN | Introduction to SQL'
seo_description: Select a numeric range that includes both endpoints.
seo_keywords:
- SQL
- PostgreSQL
- Select an inclusive range with BETWEEN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 3
  expected_rows:
  - - Hand drill
    - '4.00'
  - - Saw
    - '6.00'
  - - Camp stove
    - '6.00'
hints:
- BETWEEN includes the lower and upper bounds; keep the lower value first.
---

# Exercise: Select an inclusive range with BETWEEN

The borrower can spend from four through six units per day. Both endpoints count as affordable.

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

## Your Task

1. Return name and fee for gear with fee BETWEEN 4 AND 6, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
