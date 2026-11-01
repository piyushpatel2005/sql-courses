---
title: 'Exercise: Share a business rank across ties'
slug: exercise-rank-ties
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Give tied fees the same rank and leave a gap afterward.
seo_title: 'Exercise: Share a business rank across ties | Introduction to SQL'
seo_description: Give tied fees the same rank and leave a gap afterward.
seo_keywords:
  - SQL
  - PostgreSQL
  - Share a business rank across ties
sql:
  seed: seed.sql
  ordered: true
  expected_row_count: 6
  expected_columns:
    - category
    - name
    - fee_rank
  expected_rows:
    - - art
      - Brush kit
      - 1
    - - outdoors
      - Tent
      - 1
    - - outdoors
      - Camp stove
      - 2
    - - repair
      - Saw
      - 1
    - - repair
      - Socket set
      - 1
    - - repair
      - Hand drill
      - 3
hints:
  - Keep gear_id outside the RANK window or it will break the fee ties.
---

# Exercise: Share a business rank across ties

Rank fees within each category while preserving equal fees as peers. The final gear_id ordering makes the display stable without breaking the business tie.

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

This fixture has six gear entries, including Socket set in repair at a daily fee of 6.00. Equal fees are allowed; the gear identifiers remain distinct.

## Your Task

1. Return category, name and RANK() AS fee_rank within category, ranked by fee DESC. Display by category, fee DESC, gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
