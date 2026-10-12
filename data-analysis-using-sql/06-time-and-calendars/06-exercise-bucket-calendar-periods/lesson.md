---
title: 'Exercise: bucket calendar months without losing the year'
slug: exercise-bucket-calendar-periods
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Group timestamps by a month boundary that retains the year.
seo_title: 'Exercise: bucket calendar months without losing the year | Data Analysis Using SQL'
seo_description: Group timestamps by a month boundary that retains the year.
seo_keywords:
- SQL analysis
- exercise bucket calendar periods
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - month
  - paid_orders
  - gross
  expected_rows:
  - - '2025-01-01'
    - 2
    - '100.00'
  - - '2025-02-01'
    - 3
    - '140.00'
  - - '2025-03-01'
    - 5
    - '270.00'
  expected_row_count: 3
hints:
- DATE_TRUNC produces a complete month key; a month number alone would merge years.
---

# Exercise: bucket calendar months without losing the year

Build a UTC monthly paid-revenue report for the quarter.

Use January through March 2025 only. Keep the population filter half-open and the month definition explicitly UTC.

## Your Task

1. Return `month` as first-of-month ISO date text, `paid_orders`, and `gross`, ordered by `month`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

A month absent from this grouped result would mean no matching rows, not automatically a confirmed zero. The calendar-series lesson will make that population explicit.
