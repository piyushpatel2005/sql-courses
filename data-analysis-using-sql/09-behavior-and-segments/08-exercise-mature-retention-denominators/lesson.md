---
title: 'Exercise: separate zero retention from an unobserved period'
slug: exercise-mature-retention-denominators
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Compare only cohorts with a fully observed next calendar month.
seo_title: 'Exercise: separate zero retention from an unobserved period | Data Analysis Using SQL'
seo_description: Compare only cohorts with a fully observed next calendar month.
seo_keywords:
- SQL analysis
- exercise mature retention denominators
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - cohort
  - cohort_size
  - retained_month1
  - retention_pct
  expected_rows:
  - - '2025-01-01'
    - 2
    - 1
    - '50.00'
  - - '2025-02-01'
    - 2
    - 1
    - '50.00'
  expected_row_count: 2
hints:
- Preserve inactive members with a left join; exclude immature cohorts, not non-returners.
---

# Exercise: separate zero retention from an unobserved period

Report fully observed month-one purchaser retention.

Use registered members and paid orders before April 1, 2025 UTC. Acquire members in their first paid month. Keep only cohorts whose entire next calendar month ended by the cutoff.

## Your Task

1. Return `cohort` as ISO text, `cohort_size`, `retained_month1`, and two-decimal `retention_pct`, ordered by cohort.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

An inactive member remains in the cohort denominator. Distinct member-month activity prevents multiple orders from inflating the numerator. This describes the supplied history, not the effect of any outreach campaign.
