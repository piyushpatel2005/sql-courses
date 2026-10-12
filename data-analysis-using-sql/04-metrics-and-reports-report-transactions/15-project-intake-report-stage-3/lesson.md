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

Finish the intake report with a single coverage rate that weights regions by their import counts.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Intake projects 1–2; ratios, NULLIF, SUM and ROUND.

The overall denominator is the sum of region import counts. The numerator is the sum of usable-fee counts. An average of region percentages would give a small region the same influence as a large one.

## Your Task

1. From `intake_by_region`, return one row with `imports`, `usable_fees`, and two-decimal `coverage_pct`, dividing summed usable fees by summed imports with a zero-denominator guard.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The report is ready for the membership desk: it measures usable fee coverage among imported records. It does not measure unique members, fee collection, or the correctness of each accepted number.
