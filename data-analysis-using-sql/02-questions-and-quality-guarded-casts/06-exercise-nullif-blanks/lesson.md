---
title: 'Exercise: Mark a blank as missing with NULLIF'
slug: exercise-nullif-blanks
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Treat an empty cleaned label as missing.
seo_title: 'Exercise: Mark a blank as missing with NULLIF | Data Analysis Using SQL'
seo_description: Treat an empty cleaned label as missing.
seo_keywords:
  - SQL
  - PostgreSQL
  - Mark a blank as missing with NULLIF
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - south
    - - 3
      - north
    - - 4
      - null
    - - 5
      - null
    - - 6
      - west
hints:
  - NULLIF compares the normalized label with an empty string.
---

# Exercise: Mark a blank as missing with NULLIF

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

A blank normalized region is missing information, not a place name. Represent it as NULL and retain the import record for review.

## Your Task

1. Return import_id and NULLIF(LOWER(TRIM(region_text)), '') AS region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
