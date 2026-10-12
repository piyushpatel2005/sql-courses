---
title: 'Exercise: Normalize case with LOWER'
slug: exercise-lowercase-labels
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Give equivalent label casing a common representation.
seo_title: 'Exercise: Normalize case with LOWER | Data Analysis Using SQL'
seo_description: Give equivalent label casing a common representation.
seo_keywords:
  - SQL
  - PostgreSQL
  - Normalize case with LOWER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - normalized_region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - south
    - - 3
      - north
    - - 4
      - ''
    - - 5
      - null
    - - 6
      - west
hints:
  - Apply LOWER to the already trimmed value.
---

# Exercise: Normalize case with LOWER

Build on trimming by making region labels lowercase. Do not collapse matching labels into a single imported row.

## Your Task

1. Return import_id and LOWER(TRIM(region_text)) AS normalized_region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
