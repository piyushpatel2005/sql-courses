---
title: 'Exercise: Assign a unique position with ROW_NUMBER'
slug: exercise-row-number
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Assign each paid order a unique position with a stable tie-breaker.
seo_title: 'Exercise: Assign a unique position with ROW_NUMBER | Data Analysis Using SQL'
seo_description: Assign each paid order a unique position with a stable tie-breaker.
seo_keywords:
  - SQL
  - PostgreSQL
  - Assign a unique position with ROW_NUMBER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - queue_position
  expected_row_count: 11
  expected_rows:
    - - 107
      - '100.00'
      - 1
    - - 104
      - '80.00'
      - 2
    - - 108
      - '80.00'
      - 3
    - - 112
      - '70.00'
      - 4
    - - 102
      - '60.00'
      - 5
    - - 110
      - '50.00'
      - 6
    - - 101
      - '40.00'
      - 7
    - - 103
      - '40.00'
      - 8
    - - 109
      - '30.00'
      - 9
    - - 106
      - '20.00'
      - 10
    - - 113
      - '10.00'
      - 11
hints:
  - ROW_NUMBER needs order_id after amount to decide equal-amount positions.
---

# Exercise: Assign a unique position with ROW_NUMBER

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

Give each paid order one position in an amount-ordered review queue. When amounts tie, the smaller order ID goes first.

## Your Task

1. Return order_id, amount, and ROW_NUMBER() AS queue_position using window order amount DESC, order_id. Display by amount descending, then order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
