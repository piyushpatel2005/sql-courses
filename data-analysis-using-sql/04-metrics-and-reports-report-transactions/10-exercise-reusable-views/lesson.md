---
title: 'Exercise: Publish a query definition as a view'
slug: exercise-reusable-views
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Publish a reusable paid-order query without freezing its source.
seo_title: 'Exercise: Publish a query definition as a view | Data Analysis Using SQL'
seo_description: Publish a reusable paid-order query without freezing its source.
seo_keywords:
  - SQL
  - PostgreSQL
  - Publish a query definition as a view
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - gross
  expected_row_count: 11
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
hints:
  - The view stores the SELECT definition, not a permanent copy of its result.
---

# Exercise: Publish a query definition as a view

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `orders`

One row represents one submitted order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; equal order totals still belong to separate orders. | Primary key; unique. Required; cannot be `NULL`. |
| `member_id` · `integer` | Member key used to look up a registered member; no foreign key is declared. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `placed_at` · `timestamp with time zone` | Order occurrence instant, interpreted in UTC unless the query explicitly chooses a local reporting zone. | Required; cannot be `NULL`. |
| `status` · `text` | Order status: paid, pending and cancelled occur in the snapshot; paid defines revenue eligibility. | Required; cannot be `NULL`. |
| `amount` · `numeric(10,2)` | Whole-order gross amount in USD before refunds, not a unit price or an order-line amount. | Nullable; `NULL` means the order gross amount is unknown, not zero. |
| `coupon` · `text` | Optional coupon code recorded on the order. | Nullable; `NULL` means no coupon code is recorded. |

The status labels are observed values, not a CHECK constraint. Paid amounts are known in this supplied snapshot; the nullable column also contains an unknown pending amount. No nonnegative-amount rule or member foreign key is declared. An orphan member key is a real order, not a member registration. The supplied orphan key is 99.

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `paid_order_view`

One row represents one paid order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identity inherited unchanged from orders.order_id. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique non-NULL key inherited from the base primary key; no view primary key is declared. |
| `member_id` · `integer` | Member key inherited from the order; it may be missing or unmatched. | May be `NULL` under its source or expression policy. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, inherited from orders.amount. | May be `NULL` under its source or expression policy. The base amount is nullable; known paid sample values do not make the view enforce NOT NULL. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

A filtered projection of orders; it has no independently declared key or foreign key and reflects current source values.

Give the paid-order population a reusable name while retaining one row per paid order.

## Your Task

1. Create or replace paid_order_view with order_id, member_id, and amount AS gross for paid orders. Return those columns ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
