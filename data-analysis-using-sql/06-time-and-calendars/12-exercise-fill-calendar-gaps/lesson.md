---
title: 'Exercise: fill calendar gaps before measuring trends'
slug: exercise-fill-calendar-gaps
order: 12
language: sql
runtime: sql
lesson_type: coding
summary: Build a complete daily report from a known-complete activity feed.
seo_title: 'Exercise: fill calendar gaps before measuring trends | Data Analysis Using SQL'
seo_description: Build a complete daily report from a known-complete activity feed.
seo_keywords:
- SQL analysis
- exercise fill calendar gaps
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - day
  - gross
  expected_rows:
  - - '2025-03-01'
    - '100.00'
  - - '2025-03-02'
    - '110.00'
  - - '2025-03-03'
    - '50.00'
  - - '2025-03-04'
    - '0'
  - - '2025-03-05'
    - '10.00'
  expected_row_count: 5
hints:
- Aggregate orders by day before left joining onto the calendar.
---

# Exercise: fill calendar gaps before measuring trends

Produce a complete five-day paid-revenue series.

The supplied order feed is complete for March 1–5, 2025 in UTC. Include unmatched member orders because this is an order-source total.

## Your Task

1. Return every `day` from March 1 through March 5 as ISO text and `gross` paid amount, filling days without paid orders with zero; order by `day`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

There are two paid orders on March 2. Reduce them to one daily total before joining the calendar, or the report will have more than one row for that day.
