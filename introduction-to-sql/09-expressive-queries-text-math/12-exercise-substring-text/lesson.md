---
title: 'Exercise: Extract part of a value with SUBSTRING'
slug: exercise-substring-text
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Extract characters using a one-based starting position.
seo_title: 'Exercise: Extract part of a value with SUBSTRING | Introduction to SQL'
seo_description: Extract characters using a one-based starting position.
seo_keywords:
  - SQL
  - PostgreSQL
  - Extract part of a value with SUBSTRING
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - prefix
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  F'
    - - 2
      - Pai
    - - 3
      - '  M'
hints:
  - Use FROM for the starting position and FOR for the number of characters.
---

# Exercise: Extract part of a value with SUBSTRING

Produce a three-character preview of each raw packing label. Leading spaces count as positions, so do not trim before taking the prefix.

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

1. Return pack_id and SUBSTRING(label FROM 1 FOR 3) AS prefix from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
