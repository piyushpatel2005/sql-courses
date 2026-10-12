---
title: 'Exercise: Add a column with ALTER TABLE'
slug: exercise-add-column
order: 20
language: sql
lesson_type: coding
runtime: sql
summary: Add a field while preserving an existing table's rows.
seo_title: 'Exercise: Add a column with ALTER TABLE | Introduction to SQL'
seo_description: Add a field while preserving an existing table's rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Add a column with ALTER TABLE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - kit_id
    - name
    - inspected
  expected_row_count: 2
  expected_rows:
    - - 10
      - Mending
      - false
    - - 20
      - Sketching
      - false
hints:
  - ADD COLUMN changes the definition; the default supplies old rows with a value.
---

# Exercise: Add a column with ALTER TABLE

The kits already exist. The coordinator now needs to track whether each kit has been inspected.

## Your Task

1. Add inspected boolean NOT NULL DEFAULT false to kits. Return kit_id, name, inspected ordered by kit_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
