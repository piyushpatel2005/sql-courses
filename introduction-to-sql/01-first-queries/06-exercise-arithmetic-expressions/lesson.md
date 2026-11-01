---
title: 'Exercise: Calculate a result with arithmetic'
slug: exercise-arithmetic-expressions
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a quote from a stored daily price.
seo_title: 'Exercise: Calculate a result with arithmetic | Introduction to SQL'
seo_description: Calculate a quote from a stored daily price.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a result with arithmetic
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - three_day_fee
  expected_row_count: 5
  expected_rows:
  - - Hand drill
    - '12.00'
  - - Tent
    - '36.00'
  - - Saw
    - '18.00'
  - - Camp stove
    - '18.00'
  - - Brush kit
    - '9.00'
hints:
- Multiply the fee for each row, rather than updating the stored fee.
---

# Exercise: Calculate a result with arithmetic

A borrower needs a three-day quote for each piece of gear. The fee column stores a daily amount.

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

1. Return name and fee * 3 AS three_day_fee, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
