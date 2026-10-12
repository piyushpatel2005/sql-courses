---
title: 'Exercise: Take a bounded result with LIMIT'
slug: exercise-limit-rows
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Choose a fixed number of rows from a deliberate ordering.
seo_title: 'Exercise: Take a bounded result with LIMIT | Introduction to SQL'
seo_description: Choose a fixed number of rows from a deliberate ordering.
seo_keywords:
- SQL
- PostgreSQL
- Take a bounded result with LIMIT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 2
  expected_rows:
  - - Tent
    - '12.00'
  - - Saw
    - '6.00'
hints:
- Apply LIMIT after the ordering that decides which tied row comes first.
---

# Exercise: Take a bounded result with LIMIT

The desk has room for two items on its high-fee display. Use the stable ordering you just practiced.

## Your Task

1. Return name and fee for the two highest-fee gear rows, ordered by fee DESC then gear_id, using LIMIT 2.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
