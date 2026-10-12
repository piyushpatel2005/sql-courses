---
title: 'Exercise: Publish a query definition as a view'
slug: exercise-reusable-views
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Publish a reusable paid-order query without freezing its source.
seo_title: 'Exercise: Publish a query definition as a view | Data Analysis Using SQL'
seo_description: Publish a reusable paid-order query without freezing its source.
seo_keywords:
  - SQL
  - PostgreSQL
  - Publish a query definition as a view
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
    - - 102
      - 2
      - '60.00'
    - - 103
      - 1
      - '40.00'
    - - 104
      - 3
      - '80.00'
    - - 106
      - 4
      - '20.00'
    - - 107
      - 1
      - '100.00'
    - - 108
      - 3
      - '80.00'
    - - 109
      - 5
      - '30.00'
    - - 110
      - 99
      - '50.00'
    - - 112
      - 2
      - '70.00'
    - - 113
      - 1
      - '10.00'
hints:
  - The view stores the SELECT definition, not a permanent copy of its result.
---

# Exercise: Publish a query definition as a view

Give the paid-order population a reusable name while retaining one row per paid order.

## Your Task

1. Create or replace paid_order_view with order_id, member_id, and amount AS gross for paid orders. Return those columns ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
