---
title: 'Exercise: compare a row with a computed benchmark'
slug: exercise-subquery-benchmarks
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Compare paid orders with a mean computed from the same population.
seo_title: 'Exercise: compare a row with a computed benchmark | Data Analysis Using SQL'
seo_description: Compare paid orders with a mean computed from the same population.
seo_keywords:
- SQL analysis
- exercise subquery benchmarks
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - amount
  expected_rows:
  - - 102
    - '60.00'
  - - 104
    - '80.00'
  - - 107
    - '100.00'
  - - 108
    - '80.00'
  - - 112
    - '70.00'
  expected_row_count: 5
hints:
- Keep the paid-status condition in both the outer and inner queries.
---

# Exercise: compare a row with a computed benchmark

Find paid orders above the paid-order mean.

Use the full snapshot. The comparison must ignore pending and cancelled orders in both the outer population and the benchmark.

## Your Task

1. Return `order_id` and `amount` for paid orders strictly above the mean paid amount, ordered by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Strictly above means `>`, not `>=`. Equal-to-average values should not enter an above-average report.
