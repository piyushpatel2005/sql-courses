---
title: 'Exercise: Keep shared rows with INTERSECT'
slug: exercise-intersect-results
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Keep the distinct rows shared by two results.
seo_title: 'Exercise: Keep shared rows with INTERSECT | Introduction to SQL'
seo_description: Keep the distinct rows shared by two results.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep shared rows with INTERSECT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 1
  expected_rows:
    - - Dara
hints:
  - INTERSECT keeps membership in both inputs rather than appending the inputs.
---

# Exercise: Keep shared rows with INTERSECT

Find names present in both neighborhood invitation lists. A name should appear once in this overlap report even when it was submitted repeatedly.

## Your Task

1. Return name from north_invites INTERSECT name from south_invites, ordered alphabetically. Use INTERSECT to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
