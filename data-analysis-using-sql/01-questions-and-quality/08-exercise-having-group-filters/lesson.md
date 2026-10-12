---
title: 'Exercise: Filter completed groups with HAVING'
slug: exercise-having-group-filters
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Select repeated-key groups after their counts are known.
seo_title: 'Exercise: Filter completed groups with HAVING | Data Analysis Using SQL'
seo_description: Select repeated-key groups after their counts are known.
seo_keywords:
  - SQL
  - PostgreSQL
  - Filter completed groups with HAVING
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_key
    - copies
  expected_row_count: 1
  expected_rows:
    - - A7
      - 2
hints:
  - HAVING filters counts; WHERE filters individual imports.
---

# Exercise: Filter completed groups with HAVING

The intake desk wants just the repeated member references, without modifying any source rows.

## Your Task

1. Return member_key and copies only for groups with COUNT(*) > 1, ordered by member_key.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
