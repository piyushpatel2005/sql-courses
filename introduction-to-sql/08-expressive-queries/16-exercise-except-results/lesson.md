---
title: 'Exercise: Subtract one result with EXCEPT'
slug: exercise-except-results
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Find rows present in the first list but absent from the second.
seo_title: 'Exercise: Subtract one result with EXCEPT | Introduction to SQL'
seo_description: Find rows present in the first list but absent from the second.
seo_keywords:
  - SQL
  - PostgreSQL
  - Subtract one result with EXCEPT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 1
  expected_rows:
    - - Bela
hints:
  - EXCEPT is directional; put the population you want to keep first.
---

# Exercise: Subtract one result with EXCEPT

Find the north-team invitees who are absent from the south list. Reversing the lists would answer the south team's question instead.

## Your Task

1. Return name from north_invites EXCEPT name from south_invites, ordered alphabetically. Use EXCEPT to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
