---
title: 'Exercise: Filter rows with WHERE'
slug: exercise-where-filters
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Keep only rows that satisfy a comparison.
seo_title: 'Exercise: Filter rows with WHERE | Introduction to SQL'
seo_description: Keep only rows that satisfy a comparison.
seo_keywords:
- SQL
- PostgreSQL
- Filter rows with WHERE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 4
  expected_rows:
  - - Hand drill
    - '4.00'
  - - Saw
    - '6.00'
  - - Camp stove
    - '6.00'
  - - Brush kit
    - '3.00'
hints:
- Put WHERE after FROM; include equality when the boundary should count.
---

# Exercise: Filter rows with WHERE

The desk is listing gear that costs no more than six units per day. The upper boundary counts.

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

1. Return name and fee where fee <= 6, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
