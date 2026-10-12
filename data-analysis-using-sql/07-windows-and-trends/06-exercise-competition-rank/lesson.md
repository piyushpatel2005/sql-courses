---
title: 'Exercise: Share tied positions with RANK'
slug: exercise-competition-rank
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Give tied amounts a shared rank with gaps after ties.
seo_title: 'Exercise: Share tied positions with RANK | Data Analysis Using SQL'
seo_description: Give tied amounts a shared rank with gaps after ties.
seo_keywords:
  - SQL
  - PostgreSQL
  - Share tied positions with RANK
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - amount_rank
  expected_row_count: 11
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
    - - 112
      - '70.00'
      - 4
    - - 102
      - '60.00'
      - 5
    - - 110
      - '50.00'
      - 6
    - - 101
      - '40.00'
      - 7
    - - 103
      - '40.00'
      - 7
    - - 109
      - '30.00'
      - 9
    - - 106
      - '20.00'
      - 10
    - - 113
      - '10.00'
      - 11
hints:
  - Rank on amount alone; use order_id only to stabilize the displayed rows.
---

# Exercise: Share tied positions with RANK

Compare paid amounts without breaking ties. Equal amounts share a rank, leaving a gap before the next lower amount.

## Your Task

1. Return order_id, amount, and RANK() AS amount_rank using window order amount DESC. Display by amount descending, then order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
