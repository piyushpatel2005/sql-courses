---
title: 'Exercise: Calculate a result with arithmetic'
slug: exercise-arithmetic-expressions
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a quote from a stored daily price.
seo_title: 'Exercise: Calculate a result with arithmetic | Introduction to SQL'
seo_description: Calculate a quote from a stored daily price.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a result with arithmetic
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - three_day_fee
  expected_row_count: 5
  expected_rows:
  - - Hand drill
    - '12.00'
  - - Tent
    - '36.00'
  - - Saw
    - '18.00'
  - - Camp stove
    - '18.00'
  - - Brush kit
    - '9.00'
hints:
- Multiply the fee for each row, rather than updating the stored fee.
---

# Exercise: Calculate a result with arithmetic

A borrower needs a three-day quote for each piece of gear. The fee column stores a daily amount.

## Your Task

1. Return name and fee * 3 AS three_day_fee, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
