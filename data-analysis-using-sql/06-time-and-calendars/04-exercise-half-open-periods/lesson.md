---
title: 'Exercise: Keep adjacent time periods separate'
slug: exercise-half-open-periods
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Keep adjacent reporting periods from sharing a boundary instant.
seo_title: 'Exercise: Keep adjacent time periods separate | Data Analysis Using SQL'
seo_description: Keep adjacent reporting periods from sharing a boundary instant.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep adjacent time periods separate
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - local_day
  expected_row_count: 10
  expected_rows:
    - - 101
      - '2025-01-05'
    - - 102
      - '2025-01-31'
    - - 103
      - '2025-01-31'
    - - 104
      - '2025-02-10'
    - - 106
      - '2025-02-28'
    - - 107
      - '2025-02-28'
    - - 108
      - '2025-03-02'
    - - 109
      - '2025-03-02'
    - - 110
      - '2025-03-03'
    - - 113
      - '2025-03-05'
hints:
  - Use >= for the start and < for the next period's start.
---

# Exercise: Keep adjacent time periods separate

Inspect paid orders in the January–March UTC quarter and display each retained order date in New York. April 1 midnight is outside the quarter.

## Your Task

1. Return order_id and local_day as ISO date text under the inclusive January 1 and exclusive April 1, 2025 UTC filter, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
