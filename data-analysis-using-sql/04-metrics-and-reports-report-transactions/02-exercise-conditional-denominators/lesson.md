---
title: 'Exercise: Count matching rows with FILTER'
slug: exercise-conditional-denominators
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Count a qualifying subset without removing the other input rows.
seo_title: 'Exercise: Count matching rows with FILTER | Data Analysis Using SQL'
seo_description: Count a qualifying subset without removing the other input rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count matching rows with FILTER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - submitted
    - paid
  expected_row_count: 6
  expected_rows:
    - - 1
      - 4
      - 4
    - - 2
      - 3
      - 2
    - - 3
      - 2
      - 2
    - - 4
      - 1
      - 1
    - - 5
      - 2
      - 1
    - - 99
      - 1
      - 1
hints:
  - FILTER belongs to the paid aggregate, not to the whole query.
---

# Exercise: Count matching rows with FILTER

Count all submitted orders and paid orders for each member key, keeping pending and cancelled submissions visible in the first count.

## Your Task

1. Return member_id, COUNT(*) AS submitted, and the paid-only count AS paid using FILTER; order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
