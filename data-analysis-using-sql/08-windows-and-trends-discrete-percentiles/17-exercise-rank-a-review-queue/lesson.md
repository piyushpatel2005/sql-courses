---
title: 'Exercise: rank a review queue without erasing ties'
slug: exercise-rank-a-review-queue
order: 17
language: sql
runtime: sql
lesson_type: coding
summary: Keep every order at the two highest distinct amount levels.
seo_title: 'Exercise: rank a review queue without erasing ties | Data Analysis Using SQL'
seo_description: Keep every order at the two highest distinct amount levels.
seo_keywords:
  - SQL analysis
  - exercise rank a review queue
  - PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - amount_level
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
  expected_row_count: 3
hints:
  - Compute DENSE_RANK in a CTE, then filter its result outside the window query.
---

# Exercise: select the two highest amount levels

The repair desk will review every paid order at one of the two highest distinct amounts. A tie can make this more than two orders. Use the DENSE_RANK behavior already practiced; the new task is to filter a computed rank in an outer query.

## Your Task

1. Return order_id, amount and amount_level for paid orders with DENSE_RANK at most 2, ranked by amount descending. Display by amount descending, then order_id.

Replace `script.sql` with your report. Run it to inspect the tied values, then Submit to check the result.
