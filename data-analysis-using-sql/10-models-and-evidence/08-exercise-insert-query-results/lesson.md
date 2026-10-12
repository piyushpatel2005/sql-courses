---
title: 'Exercise: Load query results with INSERT ... SELECT'
slug: exercise-insert-query-results
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Populate a reporting table from selected source rows.
seo_title: 'Exercise: Load query results with INSERT ... SELECT | Data Analysis Using SQL'
seo_description: Populate a reporting table from selected source rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Load query results with INSERT ... SELECT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - '40.00'
    - - 102
      - '60.00'
    - - 103
      - '40.00'
    - - 104
      - '80.00'
    - - 106
      - '20.00'
    - - 107
      - '100.00'
    - - 108
      - '80.00'
    - - 109
      - '30.00'
    - - 110
      - '50.00'
    - - 112
      - '70.00'
    - - 113
      - '10.00'
hints:
  - Match the target column list with the SELECT values in the same order.
---

# Exercise: Load query results with INSERT ... SELECT

The report_orders destination is already empty. Populate it from paid orders; do not manually type the answer rows.

## Your Task

1. Insert order_id and amount into report_orders(order_id,gross) from paid orders. Return order_id,gross ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
