---
title: 'Exercise: Convert a value with CAST'
slug: exercise-cast-values
order: 20
language: sql
lesson_type: coding
runtime: sql
summary: Convert an integer before division so the fraction is retained.
seo_title: 'Exercise: Convert a value with CAST | Introduction to SQL'
seo_description: Convert an integer before division so the fraction is retained.
seo_keywords:
  - SQL
  - PostgreSQL
  - Convert a value with CAST
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - quarter_items
  expected_row_count: 3
  expected_rows:
    - - 1
      - '1.7500000000000000'
    - - 2
      - '3.0000000000000000'
    - - 3
      - '0.25000000000000000000'
hints:
  - CAST the numerator AS numeric before dividing.
---

# Exercise: Convert a value with CAST

The item quantity is an integer, but its quarter share may be fractional. Convert before division rather than trying to recover a fraction after integer division.

## Your Task

1. Return pack_id and CAST(items AS numeric) / 4 AS quarter_items from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
