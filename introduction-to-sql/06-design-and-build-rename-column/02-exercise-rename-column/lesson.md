---
title: 'Exercise: Rename a column without replacing its values'
slug: exercise-rename-column
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Change a column's name without replacing its stored values.
seo_title: 'Exercise: Rename a column without replacing its values | Introduction to SQL'
seo_description: Change a column's name without replacing its stored values.
seo_keywords:
  - SQL
  - PostgreSQL
  - Rename a column without replacing its values
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - kit_id
    - kit_name
  expected_row_count: 2
  expected_rows:
    - - 10
      - Mending
    - - 20
      - Sketching
hints:
  - RENAME COLUMN names the old field before TO and the new field after it.
---

# Exercise: Rename a column without replacing its values

The kit register calls a field name, but the coordinator wants the clearer label kit_name.

## Your Task

1. Rename kits.name to kit_name. Return kit_id and kit_name ordered by kit_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
