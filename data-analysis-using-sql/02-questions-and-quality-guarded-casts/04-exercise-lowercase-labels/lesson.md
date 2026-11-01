---
title: 'Exercise: Normalize case with LOWER'
slug: exercise-lowercase-labels
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Give equivalent label casing a common representation.
seo_title: 'Exercise: Normalize case with LOWER | Data Analysis Using SQL'
seo_description: Give equivalent label casing a common representation.
seo_keywords:
  - SQL
  - PostgreSQL
  - Normalize case with LOWER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - normalized_region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - south
    - - 3
      - north
    - - 4
      - ''
    - - 5
      - null
    - - 6
      - west
hints:
  - Apply LOWER to the already trimmed value.
---

# Exercise: Normalize case with LOWER

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `raw_intake`

One row represents one received intake record, not necessarily one distinct person.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `import_id` · `integer` | Unique receipt identifier; a retry or repeated person reference is still a separate import record. | Primary key; unique. Required; cannot be `NULL`. |
| `member_key` · `text` | Untrusted text business reference for a supposed member; it may repeat and is not members.member_id. | Nullable; `NULL` means the supposed person reference is unrecorded. |
| `region_text` · `text` | Untrusted region label with original spaces and case; blank text and SQL NULL are different source states. | Nullable; `NULL` means no region text value is recorded. |
| `fee_text` · `text` | Untrusted fee amount text intended to represent USD; blanks or invalid words are not numeric zero. | Nullable; `NULL` means no fee string is recorded, not a valid zero fee. |

No foreign key links member_key to the integer member directory. Cleaning preserves import grain; it does not deduplicate people or establish collected revenue.

Build on trimming by making region labels lowercase. Do not collapse matching labels into a single imported row.

## Your Task

1. Return import_id and LOWER(TRIM(region_text)) AS normalized_region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
