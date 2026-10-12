---
title: 'Exercise: profile missing values without hiding them'
slug: exercise-profile-missing-values
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Measure how many source amounts are known before calculating a metric.
seo_title: 'Exercise: profile missing values without hiding them | Data Analysis Using SQL'
seo_description: Measure how many source amounts are known before calculating a metric.
seo_keywords:
- SQL analysis
- exercise profile missing values
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - orders_seen
  - known_amounts
  - missing_amounts
  expected_rows:
  - - 13
    - 12
    - 1
  expected_row_count: 1
hints:
- Subtract COUNT(amount) from COUNT(*) to expose missing values.
---

# Exercise: profile missing values without hiding them

Measure the coverage of order amounts.

Include every status and every date. This is a source-quality profile, not a paid-revenue report.

## Your Task

1. Return one row with `orders_seen`, `known_amounts`, and `missing_amounts`, using row count, non-null amount count, and their difference.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Keep the missing amount visible. The pending order is a data-quality counterexample, not permission to treat unknown money as zero.
