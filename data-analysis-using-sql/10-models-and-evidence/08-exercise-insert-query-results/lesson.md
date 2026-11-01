---
title: 'Exercise: Load query results with INSERT ... SELECT'
slug: exercise-insert-query-results
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Populate a reporting table from selected source rows.
seo_title: 'Exercise: Load query results with INSERT ... SELECT | Data Analysis Using SQL'
seo_description: Populate a reporting table from selected source rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Load query results with INSERT ... SELECT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - '40.00'
    - - 102
      - '60.00'
    - - 103
      - '40.00'
    - - 104
      - '80.00'
    - - 106
      - '20.00'
    - - 107
      - '100.00'
    - - 108
      - '80.00'
    - - 109
      - '30.00'
    - - 110
      - '50.00'
    - - 112
      - '70.00'
    - - 113
      - '10.00'
hints:
  - Match the target column list with the SELECT values in the same order.
---

# Exercise: Load query results with INSERT ... SELECT

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

#### `report_orders`

One row represents one stored order-report row.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; key enforcement depends on this lesson's declaration. | Primary key; unique. Required; cannot be `NULL`. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, copied from orders.amount when loaded. | Nullable; `NULL` means the gross measure is unrecorded, not zero. |

A report table stores rows; creating it does not load them. This target is independent of the unconstrained source orders.member_id logical link.

The report_orders destination is already empty. Populate it from paid orders; do not manually type the answer rows.

## Your Task

1. Insert order_id and amount into report_orders(order_id,gross) from paid orders. Return order_id,gross ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
