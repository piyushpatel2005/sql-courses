---
title: 'Exercise: Supply an omitted value with DEFAULT'
slug: exercise-column-defaults
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Choose the value used when an insert omits a column.
seo_title: 'Exercise: Supply an omitted value with DEFAULT | Introduction to SQL'
seo_description: Choose the value used when an insert omits a column.
seo_keywords:
  - SQL
  - PostgreSQL
  - Supply an omitted value with DEFAULT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - slots
  expected_row_count: 0
  expected_rows: []
hints:
  - DEFAULT applies to an omitted value, not an explicitly supplied NULL.
---

# Exercise: Supply an omitted value with DEFAULT

Most new lockers have one slot. Define that as the value for an omitted capacity while retaining the positive-capacity rule.

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and slots integer NOT NULL DEFAULT 1 CHECK (slots > 0). Finish by selecting locker_id, slots in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
