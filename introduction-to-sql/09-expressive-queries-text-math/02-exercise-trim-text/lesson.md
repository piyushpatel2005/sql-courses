---
title: 'Exercise: Trim surrounding spaces with TRIM'
slug: exercise-trim-text
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Remove spaces around a label without removing internal spaces.
seo_title: 'Exercise: Trim surrounding spaces with TRIM | Introduction to SQL'
seo_description: Remove spaces around a label without removing internal spaces.
seo_keywords:
  - SQL
  - PostgreSQL
  - Trim surrounding spaces with TRIM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - clean_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - FIELD KIT
    - - 2
      - Paint Set
    - - 3
      - Maps
hints:
  - TRIM changes the selected value; you do not need UPDATE.
---

# Exercise: Trim surrounding spaces with TRIM

Remove padding around packing labels before printing them. Keep the identifier beside each cleaned label so staff can locate the source record.

## Your Task

1. Return pack_id and TRIM(label) AS clean_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
