---
title: 'Exercise: Validate a condition with CHECK'
slug: exercise-check-constraints
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Reject a nonpositive capacity with a row-level condition.
seo_title: 'Exercise: Validate a condition with CHECK | Introduction to SQL'
seo_description: Reject a nonpositive capacity with a row-level condition.
seo_keywords:
  - SQL
  - PostgreSQL
  - Validate a condition with CHECK
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - locker_id
    - slots
  expected_row_count: 0
  expected_rows: []
hints:
  - CHECK rejects false; NOT NULL separately rejects an absent capacity.
---

# Exercise: Validate a condition with CHECK

A locker cannot have zero or negative storage slots. Require a known capacity and reject nonpositive values.

## Your Task

1. Create lockers with locker_id integer PRIMARY KEY and slots integer NOT NULL CHECK (slots > 0). Finish by selecting locker_id, slots in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
