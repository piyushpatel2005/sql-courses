---
title: 'Exercise: Use a scalar subquery as a value'
slug: exercise-subqueries
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Compare each fee with a mean computed by a scalar subquery.
seo_title: 'Exercise: Use a scalar subquery as a value | Introduction to SQL'
seo_description: Compare each fee with a mean computed by a scalar subquery.
seo_keywords:
  - SQL
  - PostgreSQL
  - Use a scalar subquery as a value
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - fee
  expected_row_count: 1
  expected_rows:
    - - Tent
      - '12.00'
hints:
  - The inner AVG query supplies one value for the outer comparison.
---

# Exercise: Use a scalar subquery as a value

Find gear strictly above the catalog mean. Compute the mean rather than copying a number from the seed.

## Your Task

1. Return name, fee for gear above a scalar AVG(fee) subquery over all gear, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
