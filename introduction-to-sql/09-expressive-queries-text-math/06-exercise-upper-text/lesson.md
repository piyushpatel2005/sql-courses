---
title: 'Exercise: Make an uppercase label with UPPER'
slug: exercise-upper-text
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Display a label in uppercase.
seo_title: 'Exercise: Make an uppercase label with UPPER | Introduction to SQL'
seo_description: Display a label in uppercase.
seo_keywords:
  - SQL
  - PostgreSQL
  - Make an uppercase label with UPPER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - upper_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  FIELD KIT '
    - - 2
      - 'PAINT SET  '
    - - 3
      - '  MAPS'
hints:
  - UPPER changes letter case without trimming the value.
---

# Exercise: Make an uppercase label with UPPER

A new packing-label convention uses uppercase letters. Convert the displayed labels without updating the stored source.

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

1. Return pack_id and UPPER(label) AS upper_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
