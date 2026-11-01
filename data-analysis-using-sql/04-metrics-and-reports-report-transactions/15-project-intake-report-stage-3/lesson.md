---
title: 'Intake project 3: one defensible coverage rate'
slug: project-intake-report-stage-3
order: 15
language: sql
runtime: sql
lesson_type: coding
summary: Finish the intake report with a single coverage rate that weights regions by their import counts.
seo_title: 'Intake project 3: one defensible coverage rate | Data Analysis Using SQL'
seo_description: Finish the intake report with a single coverage rate that weights regions by their import counts.
seo_keywords:
- SQL analysis
- project intake report stage 3
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - imports
  - usable_fees
  - coverage_pct
  expected_rows:
  - - '6'
    - '4'
    - '66.67'
  expected_row_count: 1
hints:
- Aggregate the counts first, then divide; do not average percentages.
---

# Intake project 3: one defensible coverage rate

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `intake_by_region`

One row represents one displayed cleaned-region group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `region` · `text` | Cleaned region label; missing regions share the display bucket unknown. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique GROUP BY label; COALESCE is computation, not NOT NULL enforcement. |
| `imports` · `bigint` | Number of received import records in this region group. | Non-NULL by query lineage, not a declared NOT NULL constraint. COUNT returns a non-NULL bigint; repeated member keys are separate receipts. |
| `usable_fees` · `bigint` | Number of records with a known accepted numeric fee in this region group. | Non-NULL by query lineage, not a declared NOT NULL constraint. COUNT(fee) ignores NULL, including rejected fees; zero fees are known and counted. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

Grouping changes grain from import receipts to labels. The view stores a query definition, not frozen counts.

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

Finish the intake report with a single coverage rate that weights regions by their import counts.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Intake projects 1–2; ratios, NULLIF, SUM and ROUND.

The overall denominator is the sum of region import counts. The numerator is the sum of usable-fee counts. An average of region percentages would give a small region the same influence as a large one.

## Your Task

1. From `intake_by_region`, return one row with `imports`, `usable_fees`, and two-decimal `coverage_pct`, dividing summed usable fees by summed imports with a zero-denominator guard.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The report is ready for the membership desk: it measures usable fee coverage among imported records. It does not measure unique members, fee collection, or the correctness of each accepted number.
