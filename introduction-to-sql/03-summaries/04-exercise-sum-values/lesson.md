---
title: 'Exercise: Add known values with SUM'
slug: exercise-sum-values
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Add known fees into one catalog total.
seo_title: 'Exercise: Add known values with SUM | Introduction to SQL'
seo_description: Add known fees into one catalog total.
seo_keywords:
- SQL
- PostgreSQL
- Add known values with SUM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - total_fee
  expected_row_count: 1
  expected_rows:
  - - '31.00'
hints:
- Use SUM without GROUP BY when the report needs one overall row.
---

# Exercise: Add known values with SUM

A group plans to borrow one of every item. Calculate the combined daily fee, including equipment that is currently unavailable.

## Your Task

1. Return SUM(fee) AS total_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
