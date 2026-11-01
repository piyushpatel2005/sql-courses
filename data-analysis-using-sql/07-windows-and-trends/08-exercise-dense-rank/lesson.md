---
title: 'Exercise: Number distinct value levels with DENSE_RANK'
slug: exercise-dense-rank
order: 8
language: sql
lesson_type: coding
runtime: sql
summary: Assign consecutive levels to distinct paid amounts.
seo_title: 'Exercise: Number distinct value levels with DENSE_RANK | Data Analysis Using SQL'
seo_description: Assign consecutive levels to distinct paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Number distinct value levels with DENSE_RANK
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - amount_level
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
      - 2
    - - 112
      - '70.00'
      - 3
    - - 102
      - '60.00'
      - 4
    - - 110
      - '50.00'
      - 5
    - - 101
      - '40.00'
      - 6
    - - 103
      - '40.00'
      - 6
    - - 109
      - '30.00'
      - 7
    - - 106
      - '20.00'
      - 8
    - - 113
      - '10.00'
      - 9
hints:
  - DENSE_RANK leaves no gap after a shared level.
---

# Exercise: Number distinct value levels with DENSE_RANK

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

Number distinct paid-amount levels rather than queue positions. Equal amounts stay together, with no skipped number before the next level.

## Your Task

1. Return order_id, amount, and DENSE_RANK() AS amount_level using window order amount DESC. Display by amount descending, then order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
