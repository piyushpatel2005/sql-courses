---
title: 'Exercise: Find a maximum with MAX'
slug: exercise-maximum-value
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Find the largest known fee in the catalog.
seo_title: 'Exercise: Find a maximum with MAX | Introduction to SQL'
seo_description: Find the largest known fee in the catalog.
seo_keywords:
- SQL
- PostgreSQL
- Find a maximum with MAX
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - highest_fee
  expected_row_count: 1
  expected_rows:
  - - '12.00'
hints:
- MAX summarizes the fee column; it does not identify a particular gear row.
---

# Exercise: Find a maximum with MAX

The coordinator is checking the catalog's highest daily fee. Return one maximum even if several items eventually share it.

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

1. Return MAX(fee) AS highest_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
