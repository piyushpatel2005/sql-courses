---
title: 'Exercise: build a cohort from the first eligible purchase'
slug: exercise-acquisition-cohorts
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Assign members to the month of their first eligible purchase.
seo_title: 'Exercise: build a cohort from the first eligible purchase | Data Analysis Using SQL'
seo_description: Assign members to the month of their first eligible purchase.
seo_keywords:
- SQL analysis
- exercise acquisition cohorts
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - cohort
  - cohort_size
  expected_rows:
  - - '2025-01-01'
    - 2
  - - '2025-02-01'
    - 2
  - - '2025-03-01'
    - 1
  expected_row_count: 3
hints:
- Find each first paid timestamp before grouping people by its month.
---

# Exercise: build a cohort from the first eligible purchase

Count first-paid acquisition cohorts among registered members.

Use paid orders strictly before April 1, 2025 UTC and match to `members`. Member 99 has no registered record and is excluded from this member analysis. The dataset contains all prior purchases.

## Your Task

1. Return `cohort` as first-of-month ISO date text and `cohort_size`, ordered by `cohort`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

This is a count of acquired purchasers, not all registered members. The non-purchasing member does not belong in the denominator for a purchaser-retention cohort.
