---
title: 'Exercise: Measure a magnitude with ABS'
slug: exercise-absolute-value
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Measure how far a quantity lies from a target, ignoring direction.
seo_title: 'Exercise: Measure a magnitude with ABS | Introduction to SQL'
seo_description: Measure how far a quantity lies from a target, ignoring direction.
seo_keywords:
  - SQL
  - PostgreSQL
  - Measure a magnitude with ABS
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - distance_from_target
  expected_row_count: 3
  expected_rows:
    - - 1
      - 1
    - - 2
      - 4
    - - 3
      - 7
hints:
  - Subtract the target first, then use ABS on the difference.
---

# Exercise: Measure a magnitude with ABS

Compare each package with a target of eight items. This report needs the size of the difference, not whether the package is short or overfilled.

## Your Task

1. Return pack_id and ABS(items - 8) AS distance_from_target from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
