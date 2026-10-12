---
title: 'Exercise: Count distinct known identities'
slug: exercise-count-distinct-members
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Count known buyers once regardless of repeat purchases.
seo_title: 'Exercise: Count distinct known identities | Data Analysis Using SQL'
seo_description: Count known buyers once regardless of repeat purchases.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count distinct known identities
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - registered_buyers
  expected_row_count: 1
  expected_rows:
    - - 5
hints:
  - COUNT(DISTINCT key) counts identities, not activity rows.
---

# Exercise: Count distinct known identities

Count registered buyers with a paid purchase strictly before the cutoff, without counting repeat purchases as extra buyers.

## Your Task

1. Return one row with COUNT(DISTINCT m.member_id) AS registered_buyers from matched paid orders before April 1, 2025 UTC.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
