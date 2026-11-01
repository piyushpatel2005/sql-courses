---
title: 'Exercise: Require both conditions with AND'
slug: exercise-and-conditions
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Require availability and a price condition together.
seo_title: 'Exercise: Require both conditions with AND | Introduction to SQL'
seo_description: Require availability and a price condition together.
seo_keywords:
- SQL
- PostgreSQL
- Require both conditions with AND
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Hand drill
  - - Camp stove
hints:
- Join the two conditions with AND so neither can qualify alone.
---

# Exercise: Require both conditions with AND

A borrower needs equipment that is available now and costs at most six units per day.

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

1. Return name for gear where available is true AND fee <= 6, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
