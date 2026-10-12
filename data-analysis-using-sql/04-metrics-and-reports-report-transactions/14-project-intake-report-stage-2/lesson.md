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

Extend the clean intake layer into a region-level quality report without losing the unknown region.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Intake project 1; grouping, COUNT and COALESCE.

Use `unknown` only as the display group label. Count all imports and separately count usable fees. Do not sum fees as membership revenue: duplicate member keys have not been resolved.

## Your Task

1. Create or replace `intake_by_region` with `region` (null displayed as `unknown`), `imports`, and `usable_fees`; return those columns ordered by `region`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The unknown group is part of the report population. Dropping it would make the clean data look more complete than the source.
