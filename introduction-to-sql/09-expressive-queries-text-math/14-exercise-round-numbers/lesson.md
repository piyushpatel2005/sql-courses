---
title: 'Exercise: Round numeric output with ROUND'
slug: exercise-round-numbers
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Round a fractional calculation to a stated precision.
seo_title: 'Exercise: Round numeric output with ROUND | Introduction to SQL'
seo_description: Round a fractional calculation to a stated precision.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round numeric output with ROUND
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - quarter_items
  expected_row_count: 3
  expected_rows:
    - - 1
      - '1.8'
    - - 2
      - '3.0'
    - - 3
      - '0.3'
hints:
  - Keep the division decimal before passing its result to ROUND.
---

# Exercise: Round numeric output with ROUND

The desk is reporting one quarter of each item quantity to one decimal place. Preserve fractional division before rounding the display.

## Your Task

1. Return pack_id and ROUND(items / 4.0, 1) AS quarter_items from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
