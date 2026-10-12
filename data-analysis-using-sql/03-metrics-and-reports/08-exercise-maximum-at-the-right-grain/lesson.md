---
title: 'Exercise: Find the largest known observation'
slug: exercise-maximum-at-the-right-grain
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Find each member's largest known paid amount.
seo_title: 'Exercise: Find the largest known observation | Data Analysis Using SQL'
seo_description: Find each member's largest known paid amount.
seo_keywords:
  - SQL
  - PostgreSQL
  - Find the largest known observation
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - largest_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '100.00'
    - - 2
      - '70.00'
    - - 3
      - '80.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 99
      - '50.00'
hints:
  - MAX returns one extreme per member-key group.
---

# Exercise: Find the largest known observation

Find each member key's largest paid amount across the snapshot. Cancelled orders must not affect this extreme.

## Your Task

1. Return member_id and MAX(amount) AS largest_order for paid orders, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
