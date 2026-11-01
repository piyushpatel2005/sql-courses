---
title: 'Exercise: Choose a display fallback with COALESCE'
slug: exercise-coalesce-labels
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Display unknown for a missing cleaned region.
seo_title: 'Exercise: Choose a display fallback with COALESCE | Data Analysis Using SQL'
seo_description: Display unknown for a missing cleaned region.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a display fallback with COALESCE
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
      - unknown
    - - 5
      - unknown
    - - 6
      - west
hints:
  - Convert blanks to NULL before adding the COALESCE fallback.
---

# Exercise: Choose a display fallback with COALESCE

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

Display unknown for regions that remain missing after cleanup. Keep that presentation choice separate from the raw source text.

## Your Task

1. Return import_id and COALESCE(NULLIF(LOWER(TRIM(region_text)), ''), 'unknown') AS region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
