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

Inspect paid repair orders without changing their grain.

For this first inspection, use the full snapshot, including April. We will add reporting-period boundaries later; here the only population rule is `status = 'paid'`.

## Your Task

1. Return `order_id`, `member_id`, and `amount` for paid orders, ordered by `order_id` ascending.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Check your interpretation: two paid orders with the same amount still represent two purchases. Do not use `DISTINCT amount` to count orders.
