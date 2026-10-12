---
title: 'Exercise: Number distinct value levels with DENSE_RANK'
slug: exercise-dense-rank
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Assign consecutive levels to distinct paid amounts.
seo_title: 'Exercise: Number distinct value levels with DENSE_RANK | Data Analysis Using SQL'
seo_description: Assign consecutive levels to distinct paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Number distinct value levels with DENSE_RANK
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - amount_level
  expected_row_count: 11
  expected_rows:
    - - 107
      - '100.00'
      - 1
    - - 104
      - '80.00'
      - 2
    - - 108
      - '80.00'
      - 2
    - - 112
      - '70.00'
      - 3
    - - 102
      - '60.00'
      - 4
    - - 110
      - '50.00'
      - 5
    - - 101
      - '40.00'
      - 6
    - - 103
      - '40.00'
      - 6
    - - 109
      - '30.00'
      - 7
    - - 106
      - '20.00'
      - 8
    - - 113
      - '10.00'
      - 9
hints:
  - DENSE_RANK leaves no gap after a shared level.
---

# Exercise: Number distinct value levels with DENSE_RANK

Number distinct paid-amount levels rather than queue positions. Equal amounts stay together, with no skipped number before the next level.

## Your Task

1. Return order_id, amount, and DENSE_RANK() AS amount_level using window order amount DESC. Display by amount descending, then order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
