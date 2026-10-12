---
title: 'Exercise: Count characters with CHAR_LENGTH'
slug: exercise-text-length
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Count the characters in a raw label, including spaces.
seo_title: 'Exercise: Count characters with CHAR_LENGTH | Introduction to SQL'
seo_description: Count the characters in a raw label, including spaces.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count characters with CHAR_LENGTH
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - characters
  expected_row_count: 3
  expected_rows:
    - - 1
      - 12
    - - 2
      - 11
    - - 3
      - 6
hints:
  - CHAR_LENGTH counts the supplied text, not a trimmed version unless you request one.
---

# Exercise: Count characters with CHAR_LENGTH

Check how many characters each raw packing label contains. Count surrounding spaces too, since this report is inspecting the input rather than cleaning it.

## Your Task

1. Return pack_id and CHAR_LENGTH(label) AS characters from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
