---
title: 'Exercise: Group records by a business key'
slug: exercise-group-records
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Count imported records for each business key.
seo_title: 'Exercise: Group records by a business key | Data Analysis Using SQL'
seo_description: Count imported records for each business key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Group records by a business key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_key
    - copies
  expected_row_count: 5
  expected_rows:
    - - A7
      - 2
    - - B8
      - 1
    - - C9
      - 1
    - - D2
      - 1
    - - E3
      - 1
hints:
  - Group by member_key rather than the unique import_id.
---

# Exercise: Group records by a business key

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

Count imports by `member_key` rather than `import_id`. At this stage keep all key groups; a repeated reference is evidence to review, not yet a decision to delete a row.

## Your Task

1. Return member_key and COUNT(*) AS copies for every member-key group, ordered by member_key.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
