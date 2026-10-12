---
title: 'Exercise: Choose a result value with CASE'
slug: exercise-case-values
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Turn a validation result into a review decision.
seo_title: 'Exercise: Choose a result value with CASE | Data Analysis Using SQL'
seo_description: Turn a validation result into a review decision.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a result value with CASE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - status
  expected_row_count: 6
  expected_rows:
    - - 1
      - approved
    - - 2
      - review
    - - 3
      - approved
    - - 4
      - review
    - - 5
      - approved
    - - 6
      - approved
hints:
  - Use the approved label only in the true CASE branch.
---

# Exercise: Choose a result value with CASE

The import reviewer wants a plain-language decision for every fee string.

## Your Task

1. Return import_id and status: approved if the trimmed fee matches the nonnegative-decimal pattern, review otherwise. Use CASE and order by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
