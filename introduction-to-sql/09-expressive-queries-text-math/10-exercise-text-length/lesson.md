---
title: 'Exercise: Count characters with CHAR_LENGTH'
slug: exercise-text-length
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Count the characters in a raw label, including spaces.
seo_title: 'Exercise: Count characters with CHAR_LENGTH | Introduction to SQL'
seo_description: Count the characters in a raw label, including spaces.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count characters with CHAR_LENGTH
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - characters
  expected_row_count: 3
  expected_rows:
    - - 1
      - 12
    - - 2
      - 11
    - - 3
      - 6
hints:
  - CHAR_LENGTH counts the supplied text, not a trimmed version unless you request one.
---

# Exercise: Count characters with CHAR_LENGTH

Check how many characters each raw packing label contains. Count surrounding spaces too, since this report is inspecting the input rather than cleaning it.

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

1. Return pack_id and CHAR_LENGTH(label) AS characters from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
