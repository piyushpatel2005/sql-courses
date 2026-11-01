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

## Data model

### Exercise data

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `report_orders`

One row represents one stored order-report row.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; key enforcement depends on this lesson's declaration. | Primary key; unique. Required; cannot be `NULL`. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, copied from orders.amount when loaded. | Nullable; `NULL` means the gross measure is unrecorded, not zero. |

A report table stores rows; creating it does not load them. This target is independent of the unconstrained source orders.member_id logical link.

An order-grain table must not accept the same order ID twice. Declare that identity before the reporting load introduces data.

## Your Task

1. Create report_orders with order_id integer PRIMARY KEY,gross numeric(10,2). Finish by selecting order_id,gross in that order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
