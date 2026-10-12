---
title: 'Exercise: Measure purchase frequency at order grain'
slug: exercise-purchase-frequency
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Count eligible orders while retaining members who never bought.
seo_title: 'Exercise: Measure purchase frequency at order grain | Data Analysis Using SQL'
seo_description: Count eligible orders while retaining members who never bought.
seo_keywords:
  - SQL
  - PostgreSQL
  - Measure purchase frequency at order grain
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - frequency
  expected_row_count: 6
  expected_rows:
    - - 1
      - 4
    - - 2
      - 1
    - - 3
      - 2
    - - 4
      - 1
    - - 5
      - 1
    - - 6
      - 0
hints:
  - Count the joined order key, not COUNT(*) over a null-extended member row.
---

# Exercise: Measure purchase frequency at order grain

Count eligible paid purchases for every registered member as of April 1, using all earlier purchase history.

## Your Task

1. Return member_id and frequency, counting paid order IDs strictly before April 1, 2025 UTC with a left join. Order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
