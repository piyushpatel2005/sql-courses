---
title: 'Exercise: Filter completed groups with HAVING'
slug: exercise-having-group-filters
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Select repeated-key groups after their counts are known.
seo_title: 'Exercise: Filter completed groups with HAVING | Data Analysis Using SQL'
seo_description: Select repeated-key groups after their counts are known.
seo_keywords:
  - SQL
  - PostgreSQL
  - Filter completed groups with HAVING
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_key
    - copies
  expected_row_count: 1
  expected_rows:
    - - A7
      - 2
hints:
  - HAVING filters counts; WHERE filters individual imports.
---

# Exercise: Filter completed groups with HAVING

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

The intake desk wants just the repeated member references, without modifying any source rows.

## Your Task

1. Return member_key and copies only for groups with COUNT(*) > 1, ordered by member_key.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
