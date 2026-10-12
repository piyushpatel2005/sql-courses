---
title: 'Exercise: Find a minimum with MIN'
slug: exercise-minimum-value
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Find the smallest known fee without selecting an arbitrary item.
seo_title: 'Exercise: Find a minimum with MIN | Introduction to SQL'
seo_description: Find the smallest known fee without selecting an arbitrary item.
seo_keywords:
- SQL
- PostgreSQL
- Find a minimum with MIN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - lowest_fee
  expected_row_count: 1
  expected_rows:
  - - '3.00'
hints:
- MIN returns a value, not the item whose row contains it.
---

# Exercise: Find a minimum with MIN

A price notice needs the lowest daily fee in the catalog. Report the fee alone; finding the item with that fee is a different question.

## Your Task

1. Return MIN(fee) AS lowest_fee for all gear in one row.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
