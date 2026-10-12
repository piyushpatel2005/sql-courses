---
title: 'Exercise: Measure recency at a fixed cutoff'
slug: exercise-purchase-recency
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Measure days since the latest eligible purchase at a fixed cutoff.
seo_title: 'Exercise: Measure recency at a fixed cutoff | Data Analysis Using SQL'
seo_description: Measure days since the latest eligible purchase at a fixed cutoff.
seo_keywords:
  - SQL
  - PostgreSQL
  - Measure recency at a fixed cutoff
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - recency_days
  expected_row_count: 6
  expected_rows:
    - - 1
      - 27
    - - 2
      - 60
    - - 3
      - 30
    - - 4
      - 32
    - - 5
      - 30
    - - 6
      - null
hints:
  - Subtract the maximum UTC purchase date from the fixed as-of date.
---

# Exercise: Measure recency at a fixed cutoff

Keep every registered member. A member without a paid purchase before April 1 has unknown purchase recency.

## Your Task

1. Return member_id and recency_days as April 1, 2025 minus the latest UTC paid purchase date before that cutoff. Use a left join and order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
