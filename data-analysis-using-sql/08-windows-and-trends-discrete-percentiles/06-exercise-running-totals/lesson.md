---
title: 'Exercise: Accumulate a running total with an explicit frame'
slug: exercise-running-totals
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Accumulate paid amounts from the start of each member's history.
seo_title: 'Exercise: Accumulate a running total with an explicit frame | Data Analysis Using SQL'
seo_description: Accumulate paid amounts from the start of each member's history.
seo_keywords:
  - SQL
  - PostgreSQL
  - Accumulate a running total with an explicit frame
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - member_id
    - amount
    - running_gross
  expected_row_count: 11
  expected_rows:
    - - 101
      - 1
      - '40.00'
      - '40.00'
    - - 103
      - 1
      - '40.00'
      - '80.00'
    - - 107
      - 1
      - '100.00'
      - '180.00'
    - - 113
      - 1
      - '10.00'
      - '190.00'
    - - 102
      - 2
      - '60.00'
      - '60.00'
    - - 112
      - 2
      - '70.00'
      - '130.00'
    - - 104
      - 3
      - '80.00'
      - '80.00'
    - - 108
      - 3
      - '80.00'
      - '160.00'
    - - 106
      - 4
      - '20.00'
      - '20.00'
    - - 109
      - 5
      - '30.00'
      - '30.00'
    - - 110
      - 99
      - '50.00'
      - '50.00'
hints:
  - Use UNBOUNDED PRECEDING for the beginning of the running frame.
---

# Exercise: Accumulate a running total with an explicit frame

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

Member 1 has four paid purchases in the full snapshot. Keep purchases separate and restart the calculation for each member key.

## Your Task

1. Return order_id, member_id, amount and running_gross. Use SUM over each member ordered by placed_at, order_id with ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW; display in that same member order.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
