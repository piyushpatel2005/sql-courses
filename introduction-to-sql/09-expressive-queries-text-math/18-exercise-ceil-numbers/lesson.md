---
title: 'Exercise: Round a packing count upward with CEIL'
slug: exercise-ceil-numbers
order: 18
language: sql
lesson_type: coding
runtime: sql
summary: Allow a whole container for a partly filled remainder.
seo_title: 'Exercise: Round a packing count upward with CEIL | Introduction to SQL'
seo_description: Allow a whole container for a partly filled remainder.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round a packing count upward with CEIL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - boxes
  expected_row_count: 3
  expected_rows:
    - - 1
      - '2'
    - - 2
      - '3'
    - - 3
      - '1'
hints:
  - Divide with a decimal operand before rounding upward with CEIL.
---

# Exercise: Round a packing count upward with CEIL

Each box holds four items. Calculate enough whole boxes for every package, including a partly filled final box.

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

1. Return pack_id and CEIL(items / 4.0) AS boxes from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
