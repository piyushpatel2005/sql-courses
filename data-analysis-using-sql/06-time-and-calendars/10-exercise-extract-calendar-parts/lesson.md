---
title: 'Exercise: Read a date component with EXTRACT'
slug: exercise-extract-calendar-parts
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Read the year and month components of a period key.
seo_title: 'Exercise: Read a date component with EXTRACT | Data Analysis Using SQL'
seo_description: Read the year and month components of a period key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a date component with EXTRACT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - period_id
    - year
    - month_number
  expected_row_count: 2
  expected_rows:
    - - 1
      - '2024'
      - '11'
    - - 2
      - '2025'
      - '1'
hints:
  - EXTRACT names the component before FROM and the date afterward.
---

# Exercise: Read a date component with EXTRACT

Expose each period key for a reporting check without merging years.

## Your Task

1. Return period_id, EXTRACT(YEAR FROM starts_on) AS year and EXTRACT(MONTH FROM starts_on) AS month_number, ordered by period_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
