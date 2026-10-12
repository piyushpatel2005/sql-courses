---
title: 'Exercise: Apply a segment policy to prepared RFM measures'
slug: exercise-rfm-segment-policy
order: 18
language: sql
lesson_type: coding
runtime: sql
summary: Apply a stated segment rule to recency, frequency and monetary measures.
seo_title: 'Exercise: Apply a segment policy to prepared RFM measures | Data Analysis Using SQL'
seo_description: Apply a stated segment rule to recency, frequency and monetary measures.
seo_keywords:
  - SQL
  - PostgreSQL
  - Apply a segment policy to prepared RFM measures
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - recency_days
    - frequency
    - monetary
    - segment
  expected_row_count: 6
  expected_rows:
    - - 1
      - 27
      - 4
      - '190.00'
      - active_repeat
    - - 2
      - 60
      - 1
      - '60.00'
      - other
    - - 3
      - 30
      - 2
      - '160.00'
      - active_repeat
    - - 4
      - 32
      - 1
      - '20.00'
      - other
    - - 5
      - 30
      - 1
      - '30.00'
      - other
    - - 6
      - null
      - 0
      - '0'
      - never_bought
hints:
  - Handle frequency zero before applying the recent-repeat condition.
---

# Exercise: Apply a segment policy to prepared RFM measures

Combine the three measures you have already practiced into one member-grain report. Use a 45-day recency threshold and at least two purchases for active_repeat.

## Your Task

1. Return member_id, recency_days, frequency, monetary, segment for registered members using paid orders before April 1, 2025 UTC. Label frequency zero never_bought, frequency >= 2 and recency <= 45 active_repeat, otherwise other. Order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
