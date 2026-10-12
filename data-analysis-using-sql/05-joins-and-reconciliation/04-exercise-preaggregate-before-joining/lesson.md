---
title: 'Exercise: prevent join fanout with preaggregation'
slug: exercise-preaggregate-before-joining
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Calculate net amounts without repeating an order for each refund.
seo_title: 'Exercise: prevent join fanout with preaggregation | Data Analysis Using SQL'
seo_description: Calculate net amounts without repeating an order for each refund.
seo_keywords:
- SQL analysis
- exercise preaggregate before joining
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - gross
  - refunded
  - net
  expected_rows:
  - - 101
    - '40.00'
    - '8.00'
    - '32.00'
  - - 102
    - '60.00'
    - '0'
    - '60.00'
  - - 103
    - '40.00'
    - '0'
    - '40.00'
  - - 104
    - '80.00'
    - '10.00'
    - '70.00'
  - - 106
    - '20.00'
    - '0'
    - '20.00'
  - - 107
    - '100.00'
    - '20.00'
    - '80.00'
  - - 108
    - '80.00'
    - '0'
    - '80.00'
  - - 109
    - '30.00'
    - '0'
    - '30.00'
  - - 110
    - '50.00'
    - '0'
    - '50.00'
  - - 112
    - '70.00'
    - '0'
    - '70.00'
  - - 113
    - '10.00'
    - '0'
    - '10.00'
  expected_row_count: 11
hints:
- Summarize refunds to one row per order before joining.
---

# Exercise: prevent join fanout with preaggregation

Calculate net amount once per paid order.

For this full-snapshot exercise, subtract all recorded refunds from paid gross amounts. Aggregate refunds at order grain before joining.

## Your Task

1. Return `order_id`, `gross`, `refunded`, and `net`, keeping paid orders with no refund as zero refunded; order by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Order 101 has two refunds. Its gross amount must appear once, and its refund total must include both events.
