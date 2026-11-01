---
title: 'Exercise: Match an allowed list with IN'
slug: exercise-in-lists
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Match a column against an explicit list of allowed values.
seo_title: 'Exercise: Match an allowed list with IN | Introduction to SQL'
seo_description: Match a column against an explicit list of allowed values.
seo_keywords:
- SQL
- PostgreSQL
- Match an allowed list with IN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - category
  expected_row_count: 3
  expected_rows:
  - - Hand drill
    - repair
  - - Saw
    - repair
  - - Brush kit
    - art
hints:
- Put the quoted category names inside the IN parentheses.
---

# Exercise: Match an allowed list with IN

The borrower is interested in the repair and art categories. Availability is not part of this particular list.

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

1. Return name and category for gear whose category is IN ('repair', 'art'), ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
