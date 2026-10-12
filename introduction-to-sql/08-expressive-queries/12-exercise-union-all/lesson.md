---
title: 'Exercise: Keep every occurrence with UNION ALL'
slug: exercise-union-all
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Append two lists while retaining every occurrence.
seo_title: 'Exercise: Keep every occurrence with UNION ALL | Introduction to SQL'
seo_description: Append two lists while retaining every occurrence.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep every occurrence with UNION ALL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 5
  expected_rows:
    - - Bela
    - - Dara
    - - Dara
    - - Dara
    - - Esme
hints:
  - UNION ALL keeps repeated values both within and across its inputs.
---

# Exercise: Keep every occurrence with UNION ALL

The coordinator is auditing how many invitation records arrived. Retain every occurrence, including repeated records for Dara.

## Your Task

1. Return name from north_invites UNION ALL name from south_invites, ordered alphabetically. Use UNION ALL to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
