---
title: 'Exercise: Create an index without changing a result'
slug: exercise-create-index
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Declare an index while preserving the meaning of a lookup.
seo_title: 'Exercise: Create an index without changing a result | Introduction to SQL'
seo_description: Declare an index while preserving the meaning of a lookup.
seo_keywords:
  - SQL
  - PostgreSQL
  - Create an index without changing a result
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 2
  expected_rows:
    - - Hand drill
    - - Saw
hints:
  - CREATE INDEX names the index, table and indexed column; it does not change the rows selected.
---

# Exercise: Create an index without changing a result

The desk is practicing a category index on its small catalog. This is not a performance benchmark.

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

1. Create gear_category_idx on gear(category), then return name for category repair ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
