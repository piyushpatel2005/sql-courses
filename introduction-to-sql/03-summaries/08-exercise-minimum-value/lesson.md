---
title: 'Exercise: Find a minimum with MIN'
slug: exercise-minimum-value
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Find the smallest known fee without selecting an arbitrary item.
seo_title: 'Exercise: Find a minimum with MIN | Introduction to SQL'
seo_description: Find the smallest known fee without selecting an arbitrary item.
seo_keywords:
- SQL
- PostgreSQL
- Find a minimum with MIN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - lowest_fee
  expected_row_count: 1
  expected_rows:
  - - '3.00'
hints:
- MIN returns a value, not the item whose row contains it.
---

# Exercise: Find a minimum with MIN

A price notice needs the lowest daily fee in the catalog. Report the fee alone; finding the item with that fee is a different question.

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

1. Return MIN(fee) AS lowest_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
