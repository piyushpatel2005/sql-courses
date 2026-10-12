---
title: 'Exercise: Prevent repeated known values with UNIQUE'
slug: exercise-unique-values
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Reject repeated labels while keeping a separate row identifier.
seo_title: 'Exercise: Prevent repeated known values with UNIQUE | Introduction to SQL'
seo_description: Reject repeated labels while keeping a separate row identifier.
seo_keywords:
  - SQL
  - PostgreSQL
  - Prevent repeated known values with UNIQUE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - label
  expected_row_count: 0
  expected_rows: []
hints:
  - Apply UNIQUE to the label as well as the already familiar NOT NULL rule.
---

# Exercise: Prevent repeated known values with UNIQUE

Two lockers must not share a label. Keep labels required as before, and now protect their uniqueness too.

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and label text NOT NULL UNIQUE. Finish by selecting locker_id, label in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
