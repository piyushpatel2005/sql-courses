---
title: 'Exercise: Join text values with concatenation'
slug: exercise-concatenate-text
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Append a literal suffix to a stored label.
seo_title: 'Exercise: Join text values with concatenation | Introduction to SQL'
seo_description: Append a literal suffix to a stored label.
seo_keywords:
  - SQL
  - PostgreSQL
  - Join text values with concatenation
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - display_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  FIELD KIT  kit'
    - - 2
      - Paint Set   kit
    - - 3
      - '  Maps kit'
hints:
  - The || operator joins text; include the separating space in the quoted suffix.
---

# Exercise: Join text values with concatenation

Append the word kit to each packing label. Include a space before the suffix and preserve the original label exactly as supplied.

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

1. Return pack_id and label || ' kit' AS display_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
