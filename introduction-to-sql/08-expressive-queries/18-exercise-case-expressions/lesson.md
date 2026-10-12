---
title: 'Exercise: Choose a value with CASE'
slug: exercise-case-expressions
order: 18
language: sql
lesson_type: coding
runtime: sql
summary: Turn an availability condition into a readable status.
seo_title: 'Exercise: Choose a value with CASE | Introduction to SQL'
seo_description: Turn an availability condition into a readable status.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose a value with CASE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - status
  expected_row_count: 5
  expected_rows:
    - - Hand drill
      - ready
    - - Tent
      - ready
    - - Saw
      - unavailable
    - - Camp stove
      - ready
    - - Brush kit
      - unavailable
hints:
  - CASE returns the first matching THEN value; ELSE covers the other rows.
---

# Exercise: Choose a value with CASE

A borrower-facing list needs plain-language availability labels.

## Your Task

1. Return name and a CASE status: ready when available is true, unavailable otherwise. Order by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
