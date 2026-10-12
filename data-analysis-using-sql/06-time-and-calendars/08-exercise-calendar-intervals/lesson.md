---
title: 'Exercise: Advance a calendar boundary with INTERVAL'
slug: exercise-calendar-intervals
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Find the next calendar-month boundary without assuming thirty days.
seo_title: 'Exercise: Advance a calendar boundary with INTERVAL | Data Analysis Using SQL'
seo_description: Find the next calendar-month boundary without assuming thirty days.
seo_keywords:
  - SQL
  - PostgreSQL
  - Advance a calendar boundary with INTERVAL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - period_id
    - ends_on
  expected_row_count: 2
  expected_rows:
    - - 1
      - '2024-12-01'
    - - 2
      - '2025-02-01'
hints:
  - Add INTERVAL '1 month' to the first-of-month date.
---

# Exercise: Advance a calendar boundary with INTERVAL

Build the exclusive end date for each supplied reporting month.

## Your Task

1. Return period_id and starts_on + INTERVAL '1 month' cast through date to text AS ends_on, ordered by period_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
