---
title: 'Exercise: Reduce repeated activity to one row per combination'
slug: exercise-distinct-activity-rows
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Reduce repeated purchases to one member-month activity row.
seo_title: 'Exercise: Reduce repeated activity to one row per combination | Data Analysis Using SQL'
seo_description: Reduce repeated purchases to one member-month activity row.
seo_keywords:
  - SQL
  - PostgreSQL
  - Reduce repeated activity to one row per combination
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - month
  expected_row_count: 8
  expected_rows:
    - - 1
      - '2025-01-01'
    - - 1
      - '2025-02-01'
    - - 1
      - '2025-03-01'
    - - 2
      - '2025-01-01'
    - - 3
      - '2025-02-01'
    - - 3
      - '2025-03-01'
    - - 4
      - '2025-02-01'
    - - 5
      - '2025-03-01'
hints:
  - DISTINCT compares the member and month together.
---

# Exercise: Reduce repeated activity to one row per combination

Prepare member-month activity from paid orders before the fixed April 1 cutoff. Keep only orders matched to registered members.

## Your Task

1. Return distinct member_id and UTC first-of-month date text AS month for matched paid orders before April 1, 2025 UTC, ordered by member_id then month.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
