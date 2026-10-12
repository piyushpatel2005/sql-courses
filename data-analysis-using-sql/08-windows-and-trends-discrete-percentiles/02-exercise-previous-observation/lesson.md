---
title: 'Exercise: Look back one observation with LAG'
slug: exercise-previous-observation
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Read the preceding purchase within each member's sequence.
seo_title: 'Exercise: Look back one observation with LAG | Data Analysis Using SQL'
seo_description: Read the preceding purchase within each member's sequence.
seo_keywords:
  - SQL
  - PostgreSQL
  - Look back one observation with LAG
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - amount
    - previous_amount
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
      - null
    - - 103
      - 1
      - '40.00'
      - '40.00'
    - - 107
      - 1
      - '100.00'
      - '40.00'
    - - 113
      - 1
      - '10.00'
      - '100.00'
    - - 102
      - 2
      - '60.00'
      - null
    - - 112
      - 2
      - '70.00'
      - '60.00'
    - - 104
      - 3
      - '80.00'
      - null
    - - 108
      - 3
      - '80.00'
      - '80.00'
    - - 106
      - 4
      - '20.00'
      - null
    - - 109
      - 5
      - '30.00'
      - null
    - - 110
      - 99
      - '50.00'
      - null
hints:
  - LAG follows rows under the window order, not elapsed calendar days.
---

# Exercise: Look back one observation with LAG

Compare each paid order with the preceding paid purchase for that member key. Use the full snapshot and make timestamp ties deterministic.

## Your Task

1. Return order_id, member_id, amount and previous_amount using LAG. Partition by member_id and order by placed_at, order_id; use the same ordering for the displayed member sequences.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
