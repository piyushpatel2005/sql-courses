---
title: 'Exercise: Protect report row identity with a primary key'
slug: exercise-report-primary-keys
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Protect the identity of an order-grain reporting row.
seo_title: 'Exercise: Protect report row identity with a primary key | Data Analysis Using SQL'
seo_description: Protect the identity of an order-grain reporting row.
seo_keywords:
  - SQL
  - PostgreSQL
  - Protect report row identity with a primary key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - gross
  expected_row_count: 0
  expected_rows: []
hints:
  - Make order_id the primary key, not member_id, which can repeat across orders.
---

# Exercise: Protect report row identity with a primary key

An order-grain table must not accept the same order ID twice. Declare that identity before the reporting load introduces data.

## Your Task

1. Create report_orders with order_id integer PRIMARY KEY,gross numeric(10,2). Finish by selecting order_id,gross in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
