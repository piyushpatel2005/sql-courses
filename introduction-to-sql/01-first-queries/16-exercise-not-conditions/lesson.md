---
title: 'Exercise: Reverse a known condition with NOT'
slug: exercise-not-conditions
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Find the rows that fail a known boolean condition.
seo_title: 'Exercise: Reverse a known condition with NOT | Introduction to SQL'
seo_description: Find the rows that fail a known boolean condition.
seo_keywords:
- SQL
- PostgreSQL
- Reverse a known condition with NOT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Saw
  - - Brush kit
hints:
- NOT reverses the condition inside its parentheses.
---

# Exercise: Reverse a known condition with NOT

The lending desk needs an inspection list of gear that is not available.

## Your Task

1. Return name for gear where NOT (available = true), ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
