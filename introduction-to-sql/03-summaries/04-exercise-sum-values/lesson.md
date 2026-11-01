---
title: 'Exercise: Add known values with SUM'
slug: exercise-sum-values
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Add known fees into one catalog total.
seo_title: 'Exercise: Add known values with SUM | Introduction to SQL'
seo_description: Add known fees into one catalog total.
seo_keywords:
- SQL
- PostgreSQL
- Add known values with SUM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - total_fee
  expected_row_count: 1
  expected_rows:
  - - '31.00'
hints:
- Use SUM without GROUP BY when the report needs one overall row.
---

# Exercise: Add known values with SUM

A group plans to borrow one of every item. Calculate the combined daily fee, including equipment that is currently unavailable.

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

1. Return SUM(fee) AS total_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
