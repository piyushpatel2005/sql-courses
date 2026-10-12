---
title: 'Exercise: Round a numeric report value'
slug: exercise-round-a-report
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Round an aggregate result rather than every input amount.
seo_title: 'Exercise: Round a numeric report value | Data Analysis Using SQL'
seo_description: Round an aggregate result rather than every input amount.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round a numeric report value
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - average_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '47.50'
    - - 2
      - '65.00'
    - - 3
      - '80.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 99
      - '50.00'
hints:
  - Apply ROUND after AVG so intermediate precision is preserved.
---

# Exercise: Round a numeric report value

The club wants a two-decimal mean paid amount for each member key. Use all paid orders.

## Your Task

1. Return member_id and ROUND(AVG(amount), 2) AS average_order, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
