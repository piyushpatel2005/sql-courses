---
title: 'Exercise: Count distinct ranked levels'
slug: exercise-dense-rank-ties
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Number distinct fee levels without gaps after ties.
seo_title: 'Exercise: Count distinct ranked levels | Introduction to SQL'
seo_description: Number distinct fee levels without gaps after ties.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count distinct ranked levels
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
      - 2
hints:
  - DENSE_RANK shares levels; put the display tie-breaker only in the final ORDER BY.
---

# Exercise: Count distinct ranked levels

Number the distinct fee levels within each category. Equal fees share a level, and the next lower fee receives the next number without a gap.

## Your Task

1. Return category, name and DENSE_RANK() AS fee_rank within category, ranked by fee DESC. Display by category, fee DESC, gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
