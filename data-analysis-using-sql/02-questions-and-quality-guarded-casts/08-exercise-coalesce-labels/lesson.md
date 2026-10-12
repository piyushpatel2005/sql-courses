---
title: 'Exercise: Choose a display fallback with COALESCE'
slug: exercise-coalesce-labels
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Display unknown for a missing cleaned region.
seo_title: 'Exercise: Choose a display fallback with COALESCE | Data Analysis Using SQL'
seo_description: Display unknown for a missing cleaned region.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a display fallback with COALESCE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - import_id
    - region
  expected_row_count: 6
  expected_rows:
    - - 1
      - north
    - - 2
      - south
    - - 3
      - north
    - - 4
      - unknown
    - - 5
      - unknown
    - - 6
      - west
hints:
  - Convert blanks to NULL before adding the COALESCE fallback.
---

# Exercise: Choose a display fallback with COALESCE

Display unknown for regions that remain missing after cleanup. Keep that presentation choice separate from the raw source text.

## Your Task

1. Return import_id and COALESCE(NULLIF(LOWER(TRIM(region_text)), ''), 'unknown') AS region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
