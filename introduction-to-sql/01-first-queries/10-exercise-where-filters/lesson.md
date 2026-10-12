---
title: 'Exercise: Filter rows with WHERE'
slug: exercise-where-filters
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Keep only rows that satisfy a comparison.
seo_title: 'Exercise: Filter rows with WHERE | Introduction to SQL'
seo_description: Keep only rows that satisfy a comparison.
seo_keywords:
- SQL
- PostgreSQL
- Filter rows with WHERE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 4
  expected_rows:
  - - Hand drill
    - '4.00'
  - - Saw
    - '6.00'
  - - Camp stove
    - '6.00'
  - - Brush kit
    - '3.00'
hints:
- Put WHERE after FROM; include equality when the boundary should count.
---

# Exercise: Filter rows with WHERE

The desk is listing gear that costs no more than six units per day. The upper boundary counts.

## Your Task

1. Return name and fee where fee <= 6, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
