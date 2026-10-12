---
title: 'Exercise: Remove one column with DROP COLUMN'
slug: exercise-drop-column
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Remove a temporary field while keeping the rest of the table.
seo_title: 'Exercise: Remove one column with DROP COLUMN | Introduction to SQL'
seo_description: Remove a temporary field while keeping the rest of the table.
seo_keywords:
  - SQL
  - PostgreSQL
  - Remove one column with DROP COLUMN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - kit_id
    - name
  expected_row_count: 2
  expected_rows:
    - - 10
      - Mending
    - - 20
      - Sketching
hints:
  - Use ALTER TABLE with DROP COLUMN, not DROP TABLE.
---

# Exercise: Remove one column with DROP COLUMN

A temporary import marker is no longer needed, but the kit names must remain.

## Your Task

1. Drop the import_note column from kits. Return kit_id and name ordered by kit_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
