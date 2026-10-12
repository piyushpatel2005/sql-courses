---
title: 'Exercise: Assign a unique position with ROW_NUMBER'
slug: exercise-row-number
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Assign each paid order a unique position with a stable tie-breaker.
seo_title: 'Exercise: Assign a unique position with ROW_NUMBER | Data Analysis Using SQL'
seo_description: Assign each paid order a unique position with a stable tie-breaker.
seo_keywords:
  - SQL
  - PostgreSQL
  - Assign a unique position with ROW_NUMBER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - queue_position
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
      - 3
    - - 112
      - '70.00'
      - 4
    - - 102
      - '60.00'
      - 5
    - - 110
      - '50.00'
      - 6
    - - 101
      - '40.00'
      - 7
    - - 103
      - '40.00'
      - 8
    - - 109
      - '30.00'
      - 9
    - - 106
      - '20.00'
      - 10
    - - 113
      - '10.00'
      - 11
hints:
  - ROW_NUMBER needs order_id after amount to decide equal-amount positions.
---

# Exercise: Assign a unique position with ROW_NUMBER

Give each paid order one position in an amount-ordered review queue. When amounts tie, the smaller order ID goes first.

## Your Task

1. Return order_id, amount, and ROW_NUMBER() AS queue_position using window order amount DESC, order_id. Display by amount descending, then order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
