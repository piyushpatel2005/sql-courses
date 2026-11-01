---
title: 'Exercise: Count rows and known values with COUNT'
slug: exercise-count-values
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Distinguish the number of rows from the number of known notes.
seo_title: 'Exercise: Count rows and known values with COUNT | Introduction to SQL'
seo_description: Distinguish the number of rows from the number of known notes.
seo_keywords:
- SQL
- PostgreSQL
- Count rows and known values with COUNT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - item_count
  - recorded_notes
  expected_row_count: 1
  expected_rows:
  - - 5
    - 3
hints:
- COUNT(*) includes every row; COUNT(note) skips missing notes.
---

# Exercise: Count rows and known values with COUNT

Before adding up fees, count the catalog entries and how many have a recorded note. A missing note must not make the item disappear from the catalog count.

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

1. Return COUNT(*) AS item_count and COUNT(note) AS recorded_notes for all gear.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
