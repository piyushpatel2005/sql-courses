---
title: 'Exercise: Declare an index for a filter column'
slug: exercise-index-a-report-filter
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Declare a timestamp index without promising a faster tiny-fixture query.
seo_title: 'Exercise: Declare an index for a filter column | Data Analysis Using SQL'
seo_description: Declare a timestamp index without promising a faster tiny-fixture query.
seo_keywords:
  - SQL
  - PostgreSQL
  - Declare an index for a filter column
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
  expected_row_count: 5
  expected_rows:
    - - 107
      - '100.00'
    - - 108
      - '80.00'
    - - 109
      - '30.00'
    - - 110
      - '50.00'
    - - 113
      - '10.00'
hints:
  - Keep placed_at unwrapped in the half-open range predicate.
---

# Exercise: Declare an index for a filter column

Prepare a timestamp index and a March paid-order query. Keep the half-open UTC window explicit.

## Your Task

1. Create orders_placed_at_idx on orders(placed_at). Return order_id,amount for paid orders from March 1 inclusive to April 1 exclusive, 2025 UTC, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
