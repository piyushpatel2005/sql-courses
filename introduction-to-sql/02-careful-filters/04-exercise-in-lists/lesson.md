---
title: 'Exercise: Match an allowed list with IN'
slug: exercise-in-lists
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Match a column against an explicit list of allowed values.
seo_title: 'Exercise: Match an allowed list with IN | Introduction to SQL'
seo_description: Match a column against an explicit list of allowed values.
seo_keywords:
- SQL
- PostgreSQL
- Match an allowed list with IN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - category
  expected_row_count: 3
  expected_rows:
  - - Hand drill
    - repair
  - - Saw
    - repair
  - - Brush kit
    - art
hints:
- Put the quoted category names inside the IN parentheses.
---

# Exercise: Match an allowed list with IN

The borrower is interested in the repair and art categories. Availability is not part of this particular list.

## Your Task

1. Return name and category for gear whose category is IN ('repair', 'art'), ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
