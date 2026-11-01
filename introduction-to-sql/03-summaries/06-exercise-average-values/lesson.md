---
title: 'Exercise: Calculate a mean with AVG'
slug: exercise-average-values
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Calculate the mean of the catalog's known fees.
seo_title: 'Exercise: Calculate a mean with AVG | Introduction to SQL'
seo_description: Calculate the mean of the catalog's known fees.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a mean with AVG
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - average_fee
  expected_row_count: 1
  expected_rows:
  - - '6.2000000000000000'
hints:
- AVG calculates a mean; adding GROUP BY would create separate populations.
---

# Exercise: Calculate a mean with AVG

The desk wants the mean listed daily fee across its catalog. Each item contributes once, regardless of category or availability.

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

1. Return AVG(fee) AS average_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
