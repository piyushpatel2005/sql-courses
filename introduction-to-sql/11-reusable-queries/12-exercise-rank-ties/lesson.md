---
title: 'Exercise: Share a business rank across ties'
slug: exercise-rank-ties
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Give tied fees the same rank and leave a gap afterward.
seo_title: 'Exercise: Share a business rank across ties | Introduction to SQL'
seo_description: Give tied fees the same rank and leave a gap afterward.
seo_keywords:
  - SQL
  - PostgreSQL
  - Share a business rank across ties
sql:
  seed: seed.sql
  ordered: true
  expected_row_count: 6
  expected_columns:
    - category
    - name
    - fee_rank
  expected_rows:
    - - art
      - Brush kit
      - 1
    - - outdoors
      - Tent
      - 1
    - - outdoors
      - Camp stove
      - 2
    - - repair
      - Saw
      - 1
    - - repair
      - Socket set
      - 1
    - - repair
      - Hand drill
      - 3
hints:
  - Keep gear_id outside the RANK window or it will break the fee ties.
---

# Exercise: Share a business rank across ties

Rank fees within each category while preserving equal fees as peers. The final gear_id ordering makes the display stable without breaking the business tie.

## Your Task

1. Return category, name and RANK() AS fee_rank within category, ranked by fee DESC. Display by category, fee DESC, gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
