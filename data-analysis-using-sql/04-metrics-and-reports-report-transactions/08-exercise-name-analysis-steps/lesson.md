---
title: 'Exercise: name analysis steps with CTEs'
slug: exercise-name-analysis-steps
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Separate a member summary from the rule that labels it.
seo_title: 'Exercise: name analysis steps with CTEs | Data Analysis Using SQL'
seo_description: Separate a member summary from the rule that labels it.
seo_keywords:
- SQL analysis
- exercise name analysis steps
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - member_id
  - gross
  - band
  expected_rows:
  - - 1
    - '190.00'
    - high
  - - 2
    - '130.00'
    - standard
  - - 3
    - '160.00'
    - high
  - - 4
    - '20.00'
    - standard
  - - 5
    - '30.00'
    - standard
  - - 99
    - '50.00'
    - standard
  expected_row_count: 6
hints:
- The CTE produces one total per member before CASE chooses a band.
---

# Exercise: name analysis steps with CTEs

Label member spending without repeating an aggregate expression.

First summarize paid gross amount at member-key grain. Then label a total of at least 150 as `high`, and anything below it as `standard`.

## Your Task

1. Return `member_id`, `gross`, and `band` from a named totals CTE, ordered by `member_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

These thresholds are a reporting convention, not a claim about member value. The same person could move bands if the observation window changed.
