---
title: 'Exercise: Sort rows with an explicit tie-breaker'
slug: exercise-order-by
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Sort rows predictably when values tie.
seo_title: 'Exercise: Sort rows with an explicit tie-breaker | Introduction to SQL'
seo_description: Sort rows predictably when values tie.
seo_keywords:
- SQL
- PostgreSQL
- Sort rows with an explicit tie-breaker
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 5
  expected_rows:
  - - Tent
    - '12.00'
  - - Saw
    - '6.00'
  - - Camp stove
    - '6.00'
  - - Hand drill
    - '4.00'
  - - Brush kit
    - '3.00'
hints:
- Put the descending fee first and the unique identifier second in ORDER BY.
---

# Exercise: Sort rows with an explicit tie-breaker

Saw and Camp stove have the same fee. The desk needs a stable expensive-first price sheet, not an arbitrary order between tied items.

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

1. Return name and fee for all gear, ordered by fee descending and then gear_id ascending.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
