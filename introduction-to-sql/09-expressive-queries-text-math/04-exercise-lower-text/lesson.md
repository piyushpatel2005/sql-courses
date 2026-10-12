---
title: 'Exercise: Normalize letter case with LOWER'
slug: exercise-lower-text
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Display a label in lowercase.
seo_title: 'Exercise: Normalize letter case with LOWER | Introduction to SQL'
seo_description: Display a label in lowercase.
seo_keywords:
  - SQL
  - PostgreSQL
  - Normalize letter case with LOWER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - lower_label
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  field kit '
    - - 2
      - 'paint set  '
    - - 3
      - '  maps'
hints:
  - LOWER changes letter case but leaves surrounding spaces alone.
---

# Exercise: Normalize letter case with LOWER

The packing report needs lowercase labels. Change case only; leave any source spaces visible for a separate cleanup decision.

## Your Task

1. Return pack_id and LOWER(label) AS lower_label from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
