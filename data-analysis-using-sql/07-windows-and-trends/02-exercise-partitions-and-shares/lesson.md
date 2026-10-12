---
title: 'Exercise: keep detail rows while computing group shares'
slug: exercise-partitions-and-shares
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Keep individual orders beside their member's total and share.
seo_title: 'Exercise: keep detail rows while computing group shares | Data Analysis Using SQL'
seo_description: Keep individual orders beside their member's total and share.
seo_keywords:
- SQL analysis
- exercise partitions and shares
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - amount
  - member_gross
  - share_pct
  expected_rows:
  - - 101
    - 1
    - '40.00'
    - '190.00'
    - '21.05'
  - - 103
    - 1
    - '40.00'
    - '190.00'
    - '21.05'
  - - 107
    - 1
    - '100.00'
    - '190.00'
    - '52.63'
  - - 113
    - 1
    - '10.00'
    - '190.00'
    - '5.26'
  - - 102
    - 2
    - '60.00'
    - '130.00'
    - '46.15'
  - - 112
    - 2
    - '70.00'
    - '130.00'
    - '53.85'
  - - 104
    - 3
    - '80.00'
    - '160.00'
    - '50.00'
  - - 108
    - 3
    - '80.00'
    - '160.00'
    - '50.00'
  - - 106
    - 4
    - '20.00'
    - '20.00'
    - '100.00'
  - - 109
    - 5
    - '30.00'
    - '30.00'
    - '100.00'
  - - 110
    - 99
    - '50.00'
    - '50.00'
    - '100.00'
  expected_row_count: 11
hints:
- Leave ORDER BY out of SUM OVER when the denominator needs the whole partition.
---

# Exercise: keep detail rows while computing group shares

Show each paid order share of its member-key total.

Use the full paid snapshot. The denominator is paid gross for that order's member key, not the course-wide gross total.

## Your Task

1. Return `order_id`, `member_id`, `amount`, `member_gross`, and two-decimal `share_pct`, ordered by `member_id`, then `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

A member with one paid order will have a 100% share. This reports allocation within a member's purchases, not the member's share of club revenue.
