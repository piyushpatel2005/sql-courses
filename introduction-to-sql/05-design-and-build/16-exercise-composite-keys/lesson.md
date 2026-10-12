---
title: 'Exercise: Identify a relationship with a composite key'
slug: exercise-composite-keys
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Use a pair of identifiers as one relationship key.
seo_title: 'Exercise: Identify a relationship with a composite key | Introduction to SQL'
seo_description: Use a pair of identifiers as one relationship key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Identify a relationship with a composite key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - volunteer_id
    - shift_id
  expected_row_count: 0
  expected_rows: []
hints:
  - Declare PRIMARY KEY with both columns inside the same parentheses.
---

# Exercise: Identify a relationship with a composite key

A volunteer can sign up for several shifts, and a shift can have several volunteers. The pair identifies the signup.

## Your Task

1. Create signups with volunteer_id integer, shift_id integer, and PRIMARY KEY(volunteer_id,shift_id). Select both columns in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
