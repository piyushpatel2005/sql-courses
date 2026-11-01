---
title: 'Intake project 2: region coverage'
slug: project-intake-report-stage-2
order: 14
language: sql
runtime: sql
lesson_type: coding
summary: Extend the clean intake layer into a region-level quality report without losing the unknown region.
seo_title: 'Intake project 2: region coverage | Data Analysis Using SQL'
seo_description: Extend the clean intake layer into a region-level quality report without losing the unknown region.
seo_keywords:
- SQL analysis
- project intake report stage 2
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - region
  - imports
  - usable_fees
  expected_rows:
  - - north
    - 2
    - 2
  - - south
    - 1
    - 0
  - - unknown
    - 2
    - 1
  - - west
    - 1
    - 1
  expected_row_count: 4
hints:
- Group by COALESCE(region, 'unknown').
---

# Intake project 2: region coverage

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

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

#### `intake_by_region`

One row represents one displayed cleaned-region group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `region` · `text` | Cleaned region label; missing regions share the display bucket unknown. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique GROUP BY label; COALESCE is computation, not NOT NULL enforcement. |
| `imports` · `bigint` | Number of received import records in this region group. | Non-NULL by query lineage, not a declared NOT NULL constraint. COUNT returns a non-NULL bigint; repeated member keys are separate receipts. |
| `usable_fees` · `bigint` | Number of records with a known accepted numeric fee in this region group. | Non-NULL by query lineage, not a declared NOT NULL constraint. COUNT(fee) ignores NULL, including rejected fees; zero fees are known and counted. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

Grouping changes grain from import receipts to labels. The view stores a query definition, not frozen counts.

Extend the clean intake layer into a region-level quality report without losing the unknown region.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Intake project 1; grouping, COUNT and COALESCE.

Use `unknown` only as the display group label. Count all imports and separately count usable fees. Do not sum fees as membership revenue: duplicate member keys have not been resolved.

## Your Task

1. Create or replace `intake_by_region` with `region` (null displayed as `unknown`), `imports`, and `usable_fees`; return those columns ordered by `region`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The unknown group is part of the report population. Dropping it would make the clean data look more complete than the source.
