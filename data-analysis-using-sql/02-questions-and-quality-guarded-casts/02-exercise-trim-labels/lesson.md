---
title: 'Exercise: Remove surrounding spaces with TRIM'
slug: exercise-trim-labels
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Remove surrounding spaces while preserving imported row identity.
seo_title: 'Exercise: Remove surrounding spaces with TRIM | Data Analysis Using SQL'
seo_description: Remove surrounding spaces while preserving imported row identity.
seo_keywords:
  - SQL
  - PostgreSQL
  - Remove surrounding spaces with TRIM
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - trimmed_region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - SOUTH
    - - 3
      - North
    - - 4
      - ''
    - - 5
      - null
    - - 6
      - west
hints:
  - TRIM does not replace a blank with NULL or change its case.
---

# Exercise: Remove surrounding spaces with TRIM

Remove surrounding spaces from region_text while preserving each import_id. Repeated member keys remain separate imported records.

## Your Task

1. Return import_id and TRIM(region_text) AS trimmed_region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
