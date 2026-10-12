---
title: 'Exercise: Find the smallest known observation'
slug: exercise-minimum-at-the-right-grain
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Find each member's smallest known paid amount.
seo_title: 'Exercise: Find the smallest known observation | Data Analysis Using SQL'
seo_description: Find each member's smallest known paid amount.
seo_keywords:
  - SQL
  - PostgreSQL
  - Find the smallest known observation
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - smallest_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '10.00'
    - - 2
      - '60.00'
    - - 3
      - '80.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 99
      - '50.00'
hints:
  - MIN summarizes values rather than selecting a complete order row.
---

# Exercise: Find the smallest known observation

Find the smallest known paid amount for each member key. Keep unmatched keys and do not claim that the resulting amount identifies its order.

## Your Task

1. Return member_id and MIN(amount) AS smallest_order for paid orders, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
