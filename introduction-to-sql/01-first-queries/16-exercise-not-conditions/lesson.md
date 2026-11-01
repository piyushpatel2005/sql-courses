---
title: 'Exercise: Reverse a known condition with NOT'
slug: exercise-not-conditions
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Find the rows that fail a known boolean condition.
seo_title: 'Exercise: Reverse a known condition with NOT | Introduction to SQL'
seo_description: Find the rows that fail a known boolean condition.
seo_keywords:
- SQL
- PostgreSQL
- Reverse a known condition with NOT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Saw
  - - Brush kit
hints:
- NOT reverses the condition inside its parentheses.
---

# Exercise: Reverse a known condition with NOT

The lending desk needs an inspection list of gear that is not available.

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

1. Return name for gear where NOT (available = true), ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
