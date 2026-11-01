---
title: 'Exercise: Use a scalar subquery as a value'
slug: exercise-subqueries
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Compare each fee with a mean computed by a scalar subquery.
seo_title: 'Exercise: Use a scalar subquery as a value | Introduction to SQL'
seo_description: Compare each fee with a mean computed by a scalar subquery.
seo_keywords:
  - SQL
  - PostgreSQL
  - Use a scalar subquery as a value
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - fee
  expected_row_count: 1
  expected_rows:
    - - Tent
      - '12.00'
hints:
  - The inner AVG query supplies one value for the outer comparison.
---

# Exercise: Use a scalar subquery as a value

Find gear strictly above the catalog mean. Compute the mean rather than copying a number from the seed.

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

1. Return name, fee for gear above a scalar AVG(fee) subquery over all gear, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
