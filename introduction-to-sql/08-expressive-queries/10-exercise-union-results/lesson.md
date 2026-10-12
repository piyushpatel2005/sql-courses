---
title: 'Exercise: Combine distinct rows with UNION'
slug: exercise-union-results
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Combine two lists and remove equal result rows.
seo_title: 'Exercise: Combine distinct rows with UNION | Introduction to SQL'
seo_description: Combine two lists and remove equal result rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Combine distinct rows with UNION
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 3
  expected_rows:
    - - Bela
    - - Dara
    - - Esme
hints:
  - UNION compares complete selected rows and removes duplicates.
---

# Exercise: Combine distinct rows with UNION

Create one invitation list from the north and south teams. Dara should appear once even though several source records contain that name.

## Your Task

1. Return name from north_invites UNION name from south_invites, ordered alphabetically. Use UNION to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
