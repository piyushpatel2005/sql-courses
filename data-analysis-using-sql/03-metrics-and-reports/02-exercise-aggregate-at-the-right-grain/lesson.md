---
title: 'Exercise: Sum a measure at the chosen grain'
slug: exercise-aggregate-at-the-right-grain
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Sum paid amounts separately for each member key.
seo_title: 'Exercise: Sum a measure at the chosen grain | Data Analysis Using SQL'
seo_description: Sum paid amounts separately for each member key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Sum a measure at the chosen grain
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - gross
  expected_row_count: 6
  expected_rows:
    - - 1
      - '190.00'
    - - 2
      - '130.00'
    - - 3
      - '160.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 99
      - '50.00'
hints:
  - Filter paid orders before grouping; keep orphan keys in this source-level report.
---

# Exercise: Sum a measure at the chosen grain

Total paid-order value for each member key across the snapshot. Keep the unmatched member key too: this report summarizes source orders rather than registered people.

## Your Task

1. Return member_id and SUM(amount) AS gross for paid orders, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
