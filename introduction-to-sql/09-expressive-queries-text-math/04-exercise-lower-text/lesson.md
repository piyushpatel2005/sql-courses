---
title: 'Exercise: Normalize letter case with LOWER'
slug: exercise-lower-text
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Display a label in lowercase.
seo_title: 'Exercise: Normalize letter case with LOWER | Introduction to SQL'
seo_description: Display a label in lowercase.
seo_keywords:
  - SQL
  - PostgreSQL
  - Normalize letter case with LOWER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - lower_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  field kit '
    - - 2
      - 'paint set  '
    - - 3
      - '  maps'
hints:
  - LOWER changes letter case but leaves surrounding spaces alone.
---

# Exercise: Normalize letter case with LOWER

The packing report needs lowercase labels. Change case only; leave any source spaces visible for a separate cleanup decision.

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

1. Return pack_id and LOWER(label) AS lower_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
