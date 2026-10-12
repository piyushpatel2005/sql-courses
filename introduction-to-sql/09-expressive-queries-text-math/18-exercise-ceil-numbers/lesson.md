---
title: 'Exercise: Round a packing count upward with CEIL'
slug: exercise-ceil-numbers
order: 18
language: sql
lesson_type: coding
runtime: sql
summary: Allow a whole container for a partly filled remainder.
seo_title: 'Exercise: Round a packing count upward with CEIL | Introduction to SQL'
seo_description: Allow a whole container for a partly filled remainder.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round a packing count upward with CEIL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - boxes
  expected_row_count: 3
  expected_rows:
    - - 1
      - '2'
    - - 2
      - '3'
    - - 3
      - '1'
hints:
  - Divide with a decimal operand before rounding upward with CEIL.
---

# Exercise: Round a packing count upward with CEIL

Each box holds four items. Calculate enough whole boxes for every package, including a partly filled final box.

## Your Task

1. Return pack_id and CEIL(items / 4.0) AS boxes from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
