---
title: 'Exercise: Require a value with NOT NULL'
slug: exercise-not-null
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Require a recorded value in a column.
seo_title: 'Exercise: Require a value with NOT NULL | Introduction to SQL'
seo_description: Require a recorded value in a column.
seo_keywords:
  - SQL
  - PostgreSQL
  - Require a value with NOT NULL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - label
  expected_row_count: 0
  expected_rows: []
hints:
  - NOT NULL does not make text unique or forbid an empty string.
---

# Exercise: Require a value with NOT NULL

A locker label must be recorded before the row is accepted. Keep the familiar primary key and add the required-value rule to the label.

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and label text NOT NULL. Finish by selecting locker_id, label in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
