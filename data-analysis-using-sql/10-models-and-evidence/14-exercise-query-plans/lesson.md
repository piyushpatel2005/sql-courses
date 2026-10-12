---
title: 'Exercise: Inspect the proposed query plan'
slug: exercise-query-plans
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Read a proposed query plan before changing the schema.
seo_title: 'Exercise: Inspect the proposed query plan | Data Analysis Using SQL'
seo_description: Read a proposed query plan before changing the schema.
seo_keywords:
  - SQL
  - PostgreSQL
  - Inspect the proposed query plan
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - QUERY PLAN
  expected_row_count: 2
  expected_rows:
    - - Index Scan using orders_pkey on orders
    - - '  Index Cond: (order_id = 101)'
hints:
  - EXPLAIN describes planned work; ANALYZE would execute it.
---

# Exercise: Inspect the proposed query plan

Inspect the proposed work for a single-order lookup before changing the schema.

## Your Task

1. Return EXPLAIN (COSTS OFF) for SELECT order_id,amount FROM orders WHERE order_id=101. Leave the EXPLAIN statement last.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
