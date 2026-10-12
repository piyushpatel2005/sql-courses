---
title: 'Exercise: Calculate a mean with AVG'
slug: exercise-average-values
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Calculate the mean of the catalog's known fees.
seo_title: 'Exercise: Calculate a mean with AVG | Introduction to SQL'
seo_description: Calculate the mean of the catalog's known fees.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a mean with AVG
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - average_fee
  expected_row_count: 1
  expected_rows:
  - - '6.2000000000000000'
hints:
- AVG calculates a mean; adding GROUP BY would create separate populations.
---

# Exercise: Calculate a mean with AVG

The desk wants the mean listed daily fee across its catalog. Each item contributes once, regardless of category or availability.

## Your Task

1. Return AVG(fee) AS average_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
