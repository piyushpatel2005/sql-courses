---
title: 'Exercise: define the row before the metric'
slug: exercise-define-the-row
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Distinguish order counts from the quantities stored on each order.
seo_title: 'Exercise: define the row before the metric | Data Analysis Using SQL'
seo_description: Distinguish order counts from the quantities stored on each order.
seo_keywords:
- SQL analysis
- exercise define the row
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - amount
  expected_rows:
  - - 101
    - 1
    - '40.00'
  - - 102
    - 2
    - '60.00'
  - - 103
    - 1
    - '40.00'
  - - 104
    - 3
    - '80.00'
  - - 106
    - 4
    - '20.00'
  - - 107
    - 1
    - '100.00'
  - - 108
    - 3
    - '80.00'
  - - 109
    - 5
    - '30.00'
  - - 110
    - 99
    - '50.00'
  - - 112
    - 2
    - '70.00'
  - - 113
    - 1
    - '10.00'
  expected_row_count: 11
hints:
- Retain the order key so equally priced purchases remain distinguishable.
---

# Exercise: define the row before the metric

Inspect paid repair orders without changing their grain.

`orders` contains one row per order. For this first inspection, use the full snapshot, including April. `amount` is an order total in USD, not a line price.

## Your Task

1. Return `order_id`, `member_id`, and `amount` for paid orders, ordered by `order_id` ascending.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Check your interpretation: two paid orders with the same amount still represent two purchases. Do not use `DISTINCT amount` to count orders.
