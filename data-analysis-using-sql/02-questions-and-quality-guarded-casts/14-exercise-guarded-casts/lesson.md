---
title: 'Exercise: Convert approved text to numeric'
slug: exercise-guarded-casts
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Convert approved fee text while leaving rejected values missing.
seo_title: 'Exercise: Convert approved text to numeric | Data Analysis Using SQL'
seo_description: Convert approved fee text while leaving rejected values missing.
seo_keywords:
  - SQL
  - PostgreSQL
  - Convert approved text to numeric
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - fee
  expected_row_count: 6
  expected_rows:
    - - 1
      - '12.50'
    - - 2
      - null
    - - 3
      - '12.50'
    - - 4
      - null
    - - 5
      - '0'
    - - 6
      - '18.00'
hints:
  - Put the numeric conversion inside the approved CASE branch.
---

# Exercise: Convert approved text to numeric

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

Convert the intake fees without dropping the records that need review. Preserve import grain.

## Your Task

1. Return import_id and numeric fee under the taught nonnegative-decimal policy; rejected values must be NULL. Order by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
