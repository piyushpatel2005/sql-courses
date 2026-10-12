---
title: 'Exercise: Define both sides of a rate'
slug: exercise-rate-denominators
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a paid-order share from an explicit numerator and denominator.
seo_title: 'Exercise: Define both sides of a rate | Data Analysis Using SQL'
seo_description: Calculate a paid-order share from an explicit numerator and denominator.
seo_keywords:
  - SQL
  - PostgreSQL
  - Define both sides of a rate
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - submitted
    - paid
    - paid_pct
  expected_row_count: 6
  expected_rows:
    - - 1
      - 4
      - 4
      - '100.00'
    - - 2
      - 3
      - 2
      - '66.67'
    - - 3
      - 2
      - 2
      - '100.00'
    - - 4
      - 1
      - 1
      - '100.00'
    - - 5
      - 2
      - 1
      - '50.00'
    - - 99
      - 1
      - 1
      - '100.00'
hints:
  - Divide the paid count by all submissions and guard a zero denominator.
---

# Exercise: Define both sides of a rate

Report the share of all submitted orders that were paid, using the full snapshot and keeping counts beside the rate.

## Your Task

1. Return member_id, submitted, paid, and paid_pct rounded to two decimals. Use all orders as denominator and guard division by zero. Order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
