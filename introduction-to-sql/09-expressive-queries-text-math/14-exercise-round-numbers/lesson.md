---
title: 'Exercise: Round numeric output with ROUND'
slug: exercise-round-numbers
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Round a fractional calculation to a stated precision.
seo_title: 'Exercise: Round numeric output with ROUND | Introduction to SQL'
seo_description: Round a fractional calculation to a stated precision.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round numeric output with ROUND
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - quarter_items
  expected_row_count: 3
  expected_rows:
    - - 1
      - '1.8'
    - - 2
      - '3.0'
    - - 3
      - '0.3'
hints:
  - Keep the division decimal before passing its result to ROUND.
---

# Exercise: Round numeric output with ROUND

The desk is reporting one quarter of each item quantity to one decimal place. Preserve fractional division before rounding the display.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `packing`

One row represents one package record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `pack_id` · `integer` | Intended package identifier, used for ordering but not declared as a key. | Nullable; `NULL` means the identifier is unrecorded. |
| `label` · `text` | Raw packing label, including its original spaces and letter case. | Nullable; `NULL` means no label value is recorded. |
| `items` · `integer` | Whole-number count of items in the package, not its weight. | Nullable; `NULL` means the items is unrecorded, not zero. |

No primary key or nonnegative-item-count check is declared. The sample identifiers being distinct does not enforce uniqueness.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

## Your Task

1. Return pack_id and ROUND(items / 4.0, 1) AS quarter_items from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
