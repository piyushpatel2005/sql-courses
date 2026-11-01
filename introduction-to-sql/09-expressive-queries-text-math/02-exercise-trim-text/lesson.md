---
title: 'Exercise: Trim surrounding spaces with TRIM'
slug: exercise-trim-text
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Remove spaces around a label without removing internal spaces.
seo_title: 'Exercise: Trim surrounding spaces with TRIM | Introduction to SQL'
seo_description: Remove spaces around a label without removing internal spaces.
seo_keywords:
  - SQL
  - PostgreSQL
  - Trim surrounding spaces with TRIM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - clean_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - FIELD KIT
    - - 2
      - Paint Set
    - - 3
      - Maps
hints:
  - TRIM changes the selected value; you do not need UPDATE.
---

# Exercise: Trim surrounding spaces with TRIM

Remove padding around packing labels before printing them. Keep the identifier beside each cleaned label so staff can locate the source record.

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

1. Return pack_id and TRIM(label) AS clean_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
