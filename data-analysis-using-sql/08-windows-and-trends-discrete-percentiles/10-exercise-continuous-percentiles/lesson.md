---
title: 'Exercise: Interpolate a percentile with PERCENTILE_CONT'
slug: exercise-continuous-percentiles
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Compute a continuous median that may fall between observed amounts.
seo_title: 'Exercise: Interpolate a percentile with PERCENTILE_CONT | Data Analysis Using SQL'
seo_description: Compute a continuous median that may fall between observed amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Interpolate a percentile with PERCENTILE_CONT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - measured_orders
    - median_amount
  expected_row_count: 1
  expected_rows:
    - - 11
      - '50.00'
hints:
  - PERCENTILE_CONT uses WITHIN GROUP; cast its result before two-place rounding.
---

# Exercise: Interpolate a percentile with PERCENTILE_CONT

Describe the middle paid amount across the full snapshot. Count known amounts and preserve the requested percentile definition.

## Your Task

1. Return measured_orders and median_amount, using PERCENTILE_CONT(0.5) on paid amounts and rounding its numeric result to two decimals.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
