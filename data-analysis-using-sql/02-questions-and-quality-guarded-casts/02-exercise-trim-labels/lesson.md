---
title: 'Exercise: Remove surrounding spaces with TRIM'
slug: exercise-trim-labels
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Remove surrounding spaces while preserving imported row identity.
seo_title: 'Exercise: Remove surrounding spaces with TRIM | Data Analysis Using SQL'
seo_description: Remove surrounding spaces while preserving imported row identity.
seo_keywords:
  - SQL
  - PostgreSQL
  - Remove surrounding spaces with TRIM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - trimmed_region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - SOUTH
    - - 3
      - North
    - - 4
      - ''
    - - 5
      - null
    - - 6
      - west
hints:
  - TRIM does not replace a blank with NULL or change its case.
---

# Exercise: Remove surrounding spaces with TRIM

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

Remove surrounding spaces from region_text while preserving each import_id. Repeated member keys remain separate imported records.

## Your Task

1. Return import_id and TRIM(region_text) AS trimmed_region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
