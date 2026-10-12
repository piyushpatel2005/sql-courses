---
title: 'Exercise: Restrict a total to a trailing row window'
slug: exercise-rolling-frames
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Limit each purchase total to the current and two preceding orders.
seo_title: 'Exercise: Restrict a total to a trailing row window | Data Analysis Using SQL'
seo_description: Limit each purchase total to the current and two preceding orders.
seo_keywords:
  - SQL
  - PostgreSQL
  - Restrict a total to a trailing row window
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - amount
    - trailing_three_orders
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
      - '150.00'
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
  - Use 2 PRECEDING rather than UNBOUNDED PRECEDING for a trailing three-row frame.
---

# Exercise: Restrict a total to a trailing row window

Calculate a total for each member's latest three paid orders at each purchase. Member 1 has four orders, so the final frame must drop the earliest one.

## Your Task

1. Return order_id, member_id, amount and trailing_three_orders. Use SUM over each member ordered by placed_at, order_id with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW; display in that same member order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
