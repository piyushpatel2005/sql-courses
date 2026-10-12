---
title: 'Exercise: Create an index without changing a result'
slug: exercise-create-index
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Declare an index while preserving the meaning of a lookup.
seo_title: 'Exercise: Create an index without changing a result | Introduction to SQL'
seo_description: Declare an index while preserving the meaning of a lookup.
seo_keywords:
  - SQL
  - PostgreSQL
  - Create an index without changing a result
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 2
  expected_rows:
    - - Hand drill
    - - Saw
hints:
  - CREATE INDEX names the index, table and indexed column; it does not change the rows selected.
---

# Exercise: Create an index without changing a result

The desk is practicing a category index on its small catalog. This is not a performance benchmark.

## Your Task

1. Create gear_category_idx on gear(category), then return name for category repair ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
