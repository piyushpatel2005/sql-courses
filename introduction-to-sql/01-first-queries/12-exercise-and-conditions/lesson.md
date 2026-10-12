---
title: 'Exercise: Require both conditions with AND'
slug: exercise-and-conditions
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Require availability and a price condition together.
seo_title: 'Exercise: Require both conditions with AND | Introduction to SQL'
seo_description: Require availability and a price condition together.
seo_keywords:
- SQL
- PostgreSQL
- Require both conditions with AND
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Hand drill
  - - Camp stove
hints:
- Join the two conditions with AND so neither can qualify alone.
---

# Exercise: Require both conditions with AND

A borrower needs equipment that is available now and costs at most six units per day.

## Your Task

1. Return name for gear where available is true AND fee <= 6, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
