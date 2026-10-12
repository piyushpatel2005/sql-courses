---
title: 'Exercise: Find a maximum with MAX'
slug: exercise-maximum-value
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Find the largest known fee in the catalog.
seo_title: 'Exercise: Find a maximum with MAX | Introduction to SQL'
seo_description: Find the largest known fee in the catalog.
seo_keywords:
- SQL
- PostgreSQL
- Find a maximum with MAX
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - highest_fee
  expected_row_count: 1
  expected_rows:
  - - '12.00'
hints:
- MAX summarizes the fee column; it does not identify a particular gear row.
---

# Exercise: Find a maximum with MAX

The coordinator is checking the catalog's highest daily fee. Return one maximum even if several items eventually share it.

## Your Task

1. Return MAX(fee) AS highest_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
