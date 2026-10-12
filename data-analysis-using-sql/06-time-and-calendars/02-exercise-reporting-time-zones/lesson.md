---
title: 'Exercise: Interpret an instant in a reporting zone'
slug: exercise-reporting-time-zones
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Display an instant as a date in a named reporting zone.
seo_title: 'Exercise: Interpret an instant in a reporting zone | Data Analysis Using SQL'
seo_description: Display an instant as a date in a named reporting zone.
seo_keywords:
  - SQL
  - PostgreSQL
  - Interpret an instant in a reporting zone
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - local_day
  expected_row_count: 11
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
    - - 112
      - '2025-03-31'
    - - 113
      - '2025-03-05'
hints:
  - Apply AT TIME ZONE before converting the timestamp to a date.
---

# Exercise: Interpret an instant in a reporting zone

Display the local date for every paid order in the full snapshot, including April. Date display does not itself filter the population.

## Your Task

1. Return order_id and local_day as ISO date text in America/New_York for all paid orders, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
