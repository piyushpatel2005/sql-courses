---
title: 'Exercise: State the monetary measure in a member report'
slug: exercise-purchase-monetary-value
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Report gross paid value for each registered member at the cutoff.
seo_title: 'Exercise: State the monetary measure in a member report | Data Analysis Using SQL'
seo_description: Report gross paid value for each registered member at the cutoff.
seo_keywords:
  - SQL
  - PostgreSQL
  - State the monetary measure in a member report
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - monetary
  expected_row_count: 6
  expected_rows:
    - - 1
      - '190.00'
    - - 2
      - '60.00'
    - - 3
      - '160.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 6
      - '0'
hints:
  - Keep never-buyers on the left; zero-fill only because eligible amounts are known.
---

# Exercise: State the monetary measure in a member report

Report gross paid USD for every registered member before the fixed cutoff. Never-buyers should remain with zero.

## Your Task

1. Return member_id and monetary as gross paid amount strictly before April 1, 2025 UTC, ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
