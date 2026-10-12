---
title: 'Exercise: Extract part of a value with SUBSTRING'
slug: exercise-substring-text
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Extract characters using a one-based starting position.
seo_title: 'Exercise: Extract part of a value with SUBSTRING | Introduction to SQL'
seo_description: Extract characters using a one-based starting position.
seo_keywords:
  - SQL
  - PostgreSQL
  - Extract part of a value with SUBSTRING
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - pack_id
    - prefix
  expected_row_count: 3
  expected_rows:
    - - 1
      - '  F'
    - - 2
      - Pai
    - - 3
      - '  M'
hints:
  - Use FROM for the starting position and FOR for the number of characters.
---

# Exercise: Extract part of a value with SUBSTRING

Produce a three-character preview of each raw packing label. Leading spaces count as positions, so do not trim before taking the prefix.

## Your Task

1. Return pack_id and SUBSTRING(label FROM 1 FOR 3) AS prefix from packing, ordered by pack_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
