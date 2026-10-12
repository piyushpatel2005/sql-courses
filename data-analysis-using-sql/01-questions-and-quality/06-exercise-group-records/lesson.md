---
title: 'Exercise: Group records by a business key'
slug: exercise-group-records
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Count imported records for each business key.
seo_title: 'Exercise: Group records by a business key | Data Analysis Using SQL'
seo_description: Count imported records for each business key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Group records by a business key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_key
    - copies
  expected_row_count: 5
  expected_rows:
    - - A7
      - 2
    - - B8
      - 1
    - - C9
      - 1
    - - D2
      - 1
    - - E3
      - 1
hints:
  - Group by member_key rather than the unique import_id.
---

# Exercise: Group records by a business key

Count imports by member_key rather than unique import_id. At this stage keep all key groups.

## Your Task

1. Return member_key and COUNT(*) AS copies for every member-key group, ordered by member_key.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
