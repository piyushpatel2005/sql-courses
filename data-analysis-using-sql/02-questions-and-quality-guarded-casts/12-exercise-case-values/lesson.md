---
title: 'Exercise: Choose a result value with CASE'
slug: exercise-case-values
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Turn a validation result into a review decision.
seo_title: 'Exercise: Choose a result value with CASE | Data Analysis Using SQL'
seo_description: Turn a validation result into a review decision.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a result value with CASE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - status
  expected_row_count: 6
  expected_rows:
    - - 1
      - approved
    - - 2
      - review
    - - 3
      - approved
    - - 4
      - review
    - - 5
      - approved
    - - 6
      - approved
hints:
  - Use the approved label only in the true CASE branch.
---

# Exercise: Choose a result value with CASE

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

The import reviewer wants a plain-language decision for every fee string.

## Your Task

1. Return import_id and status: approved if the trimmed fee matches the nonnegative-decimal pattern, review otherwise. Use CASE and order by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
