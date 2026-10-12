---
title: 'Exercise: Convert approved text to numeric'
slug: exercise-guarded-casts
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Convert approved fee text while leaving rejected values missing.
seo_title: 'Exercise: Convert approved text to numeric | Data Analysis Using SQL'
seo_description: Convert approved fee text while leaving rejected values missing.
seo_keywords:
  - SQL
  - PostgreSQL
  - Convert approved text to numeric
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - fee
  expected_row_count: 6
  expected_rows:
    - - 1
      - '12.50'
    - - 2
      - null
    - - 3
      - '12.50'
    - - 4
      - null
    - - 5
      - '0'
    - - 6
      - '18.00'
hints:
  - Put the numeric conversion inside the approved CASE branch.
---

# Exercise: Convert approved text to numeric

Convert the intake fees without dropping the records that need review. Preserve import grain.

## Your Task

1. Return import_id and numeric fee under the taught nonnegative-decimal policy; rejected values must be NULL. Order by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
