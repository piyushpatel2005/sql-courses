---
title: 'Exercise: Accumulate a running total with an explicit frame'
slug: exercise-running-totals
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Accumulate paid amounts from the start of each member's history.
seo_title: 'Exercise: Accumulate a running total with an explicit frame | Data Analysis Using SQL'
seo_description: Accumulate paid amounts from the start of each member's history.
seo_keywords:
  - SQL
  - PostgreSQL
  - Accumulate a running total with an explicit frame
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - amount
    - running_gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
      - '40.00'
    - - 103
      - 1
      - '40.00'
      - '80.00'
    - - 107
      - 1
      - '100.00'
      - '180.00'
    - - 113
      - 1
      - '10.00'
      - '190.00'
    - - 102
      - 2
      - '60.00'
      - '60.00'
    - - 112
      - 2
      - '70.00'
      - '130.00'
    - - 104
      - 3
      - '80.00'
      - '80.00'
    - - 108
      - 3
      - '80.00'
      - '160.00'
    - - 106
      - 4
      - '20.00'
      - '20.00'
    - - 109
      - 5
      - '30.00'
      - '30.00'
    - - 110
      - 99
      - '50.00'
      - '50.00'
hints:
  - Use UNBOUNDED PRECEDING for the beginning of the running frame.
---

# Exercise: Accumulate a running total with an explicit frame

Member 1 has four paid purchases in the full snapshot. Keep purchases separate and restart the calculation for each member key.

## Your Task

1. Return order_id, member_id, amount and running_gross. Use SUM over each member ordered by placed_at, order_id with ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW; display in that same member order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
