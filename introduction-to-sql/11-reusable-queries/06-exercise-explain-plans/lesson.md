---
title: 'Exercise: Read a query plan with EXPLAIN'
slug: exercise-explain-plans
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Inspect the proposed operations for a query.
seo_title: 'Exercise: Read a query plan with EXPLAIN | Introduction to SQL'
seo_description: Inspect the proposed operations for a query.
seo_keywords:
  - SQL
  - PostgreSQL
  - Read a query plan with EXPLAIN
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - QUERY PLAN
  expected_row_count: 2
  expected_rows:
    - - Seq Scan on gear
    - - '  Filter: (category = ''repair''::text)'
hints:
  - Put EXPLAIN (COSTS OFF) before the SELECT and leave it as the final statement.
---

# Exercise: Read a query plan with EXPLAIN

Inspect how the database proposes to find repair gear. The expected plan belongs to this tiny fixed table, not a production speed guarantee.

## Your Task

1. Run EXPLAIN (COSTS OFF) on SELECT name FROM gear WHERE category = 'repair'. Leave EXPLAIN as the final statement.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
