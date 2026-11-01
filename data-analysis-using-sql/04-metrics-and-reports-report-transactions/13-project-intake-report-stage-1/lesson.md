---
title: 'Intake project 1: a reviewable clean layer'
slug: project-intake-report-stage-1
order: 13
language: sql
runtime: sql
lesson_type: coding
summary: Build an intake-quality report that the membership desk can rerun after each import.
seo_title: 'Intake project 1: a reviewable clean layer | Data Analysis Using SQL'
seo_description: Build an intake-quality report that the membership desk can rerun after each import.
seo_keywords:
- SQL analysis
- project intake report stage 1
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - import_id
  - member_key
  - region
  - fee
  expected_rows:
  - - 1
    - A7
    - north
    - '12.50'
  - - 2
    - B8
    - south
    - null
  - - 3
    - A7
    - north
    - '12.50'
  - - 4
    - C9
    - null
    - null
  - - 5
    - D2
    - null
    - '0'
  - - 6
    - E3
    - west
    - '18.00'
  expected_row_count: 6
hints:
- Reuse the two cleaning expressions, while retaining import_id.
---

# Intake project 1: a reviewable clean layer

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

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `intake_clean`

One row represents one received import record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `import_id` · `integer` | Import receipt identity inherited from raw_intake.import_id. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique key inherited from the source primary key; member_key can still repeat. |
| `member_key` · `text` | Untrusted text person reference inherited from the source; not the integer registered-member key. | May be `NULL` under its source or expression policy. |
| `region` · `text` | Trimmed lowercase region; blank or missing source text becomes NULL. | May be `NULL` under its source or expression policy. |
| `fee` · `numeric` | Accepted nonnegative-decimal fee text converted to numeric USD; rejected or missing text becomes NULL. | May be `NULL` under its source or expression policy. No declared precision or scale; an accepted zero is known money, not missing. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

This is an import-quality layer, not distinct-person membership revenue. The current source remains available unchanged.

Build an intake-quality report that the membership desk can rerun after each import.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: text normalization, guarded casts, CASE, views and transactions.

Keep the import grain in this layer. The repeated A7 key must remain visible; this project measures import quality rather than unique people. A missing region or rejected fee is a review item, not an automatic deletion.

## Your Task

1. Create or replace `intake_clean` with `import_id`, `member_key`, cleaned `region`, and numeric `fee` under the taught nonnegative-decimal policy. Return all four columns ordered by `import_id`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The layer separates policy from presentation. If the desk later accepts signed fees, change that policy here and review its downstream effect.
