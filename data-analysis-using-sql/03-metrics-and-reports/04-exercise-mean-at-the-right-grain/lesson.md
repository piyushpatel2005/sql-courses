---
title: 'Exercise: Calculate the mean of known observations'
slug: exercise-mean-at-the-right-grain
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a mean over each member's known paid amounts.
seo_title: 'Exercise: Calculate the mean of known observations | Data Analysis Using SQL'
seo_description: Calculate a mean over each member's known paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Calculate the mean of known observations
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - average_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '47.5000000000000000'
    - - 2
      - '65.0000000000000000'
    - - 3
      - '80.0000000000000000'
    - - 4
      - '20.0000000000000000'
    - - 5
      - '30.0000000000000000'
    - - 99
      - '50.0000000000000000'
hints:
  - AVG ignores unknown amounts; keep the paid-order population explicit.
---

# Exercise: Calculate the mean of known observations

Compare each member key's mean paid-order amount. A repeat buyer contributes several orders to the mean, not one precomputed customer total.

## Your Task

1. Return member_id and AVG(amount) AS average_order for paid orders, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
