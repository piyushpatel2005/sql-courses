---
title: 'Exercise: Look ahead one observation with LEAD'
slug: exercise-next-observation
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Read the following purchase within each member's sequence.
seo_title: 'Exercise: Look ahead one observation with LEAD | Data Analysis Using SQL'
seo_description: Read the following purchase within each member's sequence.
seo_keywords:
  - SQL
  - PostgreSQL
  - Look ahead one observation with LEAD
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - amount
    - next_amount
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
      - '40.00'
    - - 103
      - 1
      - '40.00'
      - '100.00'
    - - 107
      - 1
      - '100.00'
      - '10.00'
    - - 113
      - 1
      - '10.00'
      - null
    - - 102
      - 2
      - '60.00'
      - '70.00'
    - - 112
      - 2
      - '70.00'
      - null
    - - 104
      - 3
      - '80.00'
      - '80.00'
    - - 108
      - 3
      - '80.00'
      - null
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
  - LEAD returns NULL when the ordered partition has no following row.
---

# Exercise: Look ahead one observation with LEAD

Compare each paid order with the following paid purchase for that member key. Use the full snapshot and make timestamp ties deterministic.

## Your Task

1. Return order_id, member_id, amount and next_amount using LEAD. Partition by member_id and order by placed_at, order_id; use the same ordering for the displayed member sequences.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
