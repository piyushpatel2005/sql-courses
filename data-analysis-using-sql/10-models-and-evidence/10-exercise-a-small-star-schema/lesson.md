---
title: 'Exercise: model a report with facts and dimensions'
slug: exercise-a-small-star-schema
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Separate order measurements from current member descriptions.
seo_title: 'Exercise: model a report with facts and dimensions | Data Analysis Using SQL'
seo_description: Separate order measurements from current member descriptions.
seo_keywords:
- SQL analysis
- exercise a small star schema
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - member_id
  - paid_orders
  - gross
  expected_rows:
  - - 1
    - 4
    - '190.00'
  - - 2
    - 2
    - '130.00'
  - - 3
    - 2
    - '160.00'
  - - 4
    - 1
    - '20.00'
  - - 5
    - 1
    - '30.00'
  expected_row_count: 5
hints:
- Load only matching member keys before enforcing the reporting foreign key.
---

# Exercise: model a report with facts and dimensions

Build and inspect a paid-order fact table at order grain.

The existing `members` table is the current-member dimension. Include paid orders with a matching member across the full snapshot. Define `fact_paid_orders(order_id integer PRIMARY KEY, member_id integer REFERENCES members(member_id), gross numeric(10,2))`.

## Your Task

1. Create and populate `fact_paid_orders`, then return `member_id`, `paid_orders`, and `gross` aggregated from that table, ordered by `member_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

The final result is graded, not the table constraints themselves. Use the stated keys and foreign key to practice the model. Explain the excluded member-99 order before comparing this total with an all-order report.
