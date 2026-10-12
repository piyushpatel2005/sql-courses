---
title: 'Exercise: Mark a blank as missing with NULLIF'
slug: exercise-nullif-blanks
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Treat an empty cleaned label as missing.
seo_title: 'Exercise: Mark a blank as missing with NULLIF | Data Analysis Using SQL'
seo_description: Treat an empty cleaned label as missing.
seo_keywords:
  - SQL
  - PostgreSQL
  - Mark a blank as missing with NULLIF
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
      - null
    - - 5
      - null
    - - 6
      - west
hints:
  - NULLIF compares the normalized label with an empty string.
---

# Exercise: Mark a blank as missing with NULLIF

A blank normalized region is missing information, not a place name. Represent it as NULL and retain the import record for review.

## Your Task

1. Return import_id and NULLIF(LOWER(TRIM(region_text)), '') AS region from raw_intake, ordered by import_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
