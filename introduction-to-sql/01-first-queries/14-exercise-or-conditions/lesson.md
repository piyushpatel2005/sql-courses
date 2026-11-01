---
title: 'Exercise: Accept either condition with OR'
slug: exercise-or-conditions
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Accept either category while keeping an availability requirement.
seo_title: 'Exercise: Accept either condition with OR | Introduction to SQL'
seo_description: Accept either category while keeping an availability requirement.
seo_keywords:
- SQL
- PostgreSQL
- Accept either condition with OR
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 3
  expected_rows:
  - - Hand drill
  - - Tent
  - - Camp stove
hints:
- Parentheses keep the category alternatives together under the availability rule.
---

# Exercise: Accept either condition with OR

The desk can lend only available gear, and this borrower wants either repair or outdoors equipment. Saw checks unavailable repair gear, but the fixture has no unavailable outdoors row; inspect your parentheses as well as the result.

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

1. Return name for available gear in repair or outdoors. Group the category alternatives with parentheses and order by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
