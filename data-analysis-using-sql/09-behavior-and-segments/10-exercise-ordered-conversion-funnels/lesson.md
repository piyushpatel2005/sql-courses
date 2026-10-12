---
title: 'Exercise: require the funnel steps to happen in sequence'
slug: exercise-ordered-conversion-funnels
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Count one strictly ordered, time-limited path per member.
seo_title: 'Exercise: require the funnel steps to happen in sequence | Data Analysis Using SQL'
seo_description: Count one strictly ordered, time-limited path per member.
seo_keywords:
- SQL analysis
- exercise ordered conversion funnels
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - visited
  - booked
  - paid
  - conversion_pct
  expected_rows:
  - - 5
    - 4
    - 2
    - '40.00'
  expected_row_count: 1
hints:
- Find each next step after its valid predecessor and before the shared time limit.
---

# Exercise: require the funnel steps to happen in sequence

Summarize a strictly ordered visit-to-book-to-pay funnel.

Entry is each member's first visit from January 1 through March 17, 2025 UTC (March 18 exclusive), allowing a full 14-day follow-up before April 1. Require visit < book < pay and later steps at most 14 days after entry. Ignore arrivals at or after April 1 and use occurrence timestamps for sequence.

## Your Task

1. Return one row with `visited`, `booked`, `paid`, and two-decimal `conversion_pct` (paid divided by visited), using one path per member.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Member 2 paid before visiting; member 4 booked at the exact visit time. Neither should complete this strict funnel. Member 5 pays after the 14-day window, and member 6 enters after the allowed entry window. The repeated e3 arrival must not create another converting member. A funnel drop-off suggests where to investigate, not why a person stopped.
