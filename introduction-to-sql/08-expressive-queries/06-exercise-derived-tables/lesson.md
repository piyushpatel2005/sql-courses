---
title: 'Exercise: Read a subquery as a table'
slug: exercise-derived-tables
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Query a grouped result as an intermediate table.
seo_title: 'Exercise: Read a subquery as a table | Introduction to SQL'
seo_description: Query a grouped result as an intermediate table.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a subquery as a table
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - category
    - total_fee
  expected_row_count: 2
  expected_rows:
    - - outdoors
      - '18.00'
    - - repair
      - '10.00'
hints:
  - Alias the parenthesized FROM query so its totals become outer columns.
---

# Exercise: Read a subquery as a table

Separate the catalog category totals from the rule that selects sufficiently large totals.

## Your Task

1. Use a FROM subquery to compute category and SUM(fee) AS total_fee. Return categories with total_fee >= 10, ordered by category.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
