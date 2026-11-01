---
title: 'Exercise: Choose a value with CASE'
slug: exercise-case-expressions
order: 18
language: sql
lesson_type: coding
runtime: sql
summary: Turn an availability condition into a readable status.
seo_title: 'Exercise: Choose a value with CASE | Introduction to SQL'
seo_description: Turn an availability condition into a readable status.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a value with CASE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - status
  expected_row_count: 5
  expected_rows:
    - - Hand drill
      - ready
    - - Tent
      - ready
    - - Saw
      - unavailable
    - - Camp stove
      - ready
    - - Brush kit
      - unavailable
hints:
  - CASE returns the first matching THEN value; ELSE covers the other rows.
---

# Exercise: Choose a value with CASE

A borrower-facing list needs plain-language availability labels.

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

1. Return name and a CASE status: ready when available is true, unavailable otherwise. Order by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
