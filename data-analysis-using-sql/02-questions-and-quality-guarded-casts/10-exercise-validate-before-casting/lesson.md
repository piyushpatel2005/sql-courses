---
title: 'Exercise: Test decimal text with a regular expression'
slug: exercise-validate-before-casting
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Check whether fee text follows a stated decimal policy.
seo_title: 'Exercise: Test decimal text with a regular expression | Data Analysis Using SQL'
seo_description: Check whether fee text follows a stated decimal policy.
seo_keywords:
  - SQL
  - PostgreSQL
  - Test decimal text with a regular expression
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - approved
  expected_row_count: 6
  expected_rows:
    - - 1
      - true
    - - 2
      - false
    - - 3
      - true
    - - 4
      - false
    - - 5
      - true
    - - 6
      - true
hints:
  - Anchor the whole trimmed string; a numeric-looking fragment is not enough.
---

# Exercise: Test decimal text with a regular expression

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

The intake desk needs to see which fee strings satisfy its nonnegative-decimal policy before trying to convert them.

## Your Task

1. Return import_id and approved, the boolean result of the taught regular-expression check on TRIM(fee_text). Keep all rows, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
