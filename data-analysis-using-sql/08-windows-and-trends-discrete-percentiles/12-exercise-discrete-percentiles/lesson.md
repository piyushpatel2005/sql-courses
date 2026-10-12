---
title: 'Exercise: Choose an observed percentile with PERCENTILE_DISC'
slug: exercise-discrete-percentiles
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Choose a median from the observed paid amounts.
seo_title: 'Exercise: Choose an observed percentile with PERCENTILE_DISC | Data Analysis Using SQL'
seo_description: Choose a median from the observed paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose an observed percentile with PERCENTILE_DISC
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - measured_orders
    - observed_median
  expected_row_count: 1
  expected_rows:
    - - 11
      - '50.00'
hints:
  - PERCENTILE_DISC selects a recorded value rather than interpolating.
---

# Exercise: Choose an observed percentile with PERCENTILE_DISC

Report a median that is an observed paid amount, rather than an interpolated value. Keep the known-order count beside it.

## Your Task

1. Return measured_orders and observed_median, using PERCENTILE_DISC(0.5) on paid amounts and rounding its numeric result to two decimals.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
