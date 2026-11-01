---
title: 'Exercise: Calculate the mean of known observations'
slug: exercise-mean-at-the-right-grain
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a mean over each member's known paid amounts.
seo_title: 'Exercise: Calculate the mean of known observations | Data Analysis Using SQL'
seo_description: Calculate a mean over each member's known paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Calculate the mean of known observations
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - average_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '47.5000000000000000'
    - - 2
      - '65.0000000000000000'
    - - 3
      - '80.0000000000000000'
    - - 4
      - '20.0000000000000000'
    - - 5
      - '30.0000000000000000'
    - - 99
      - '50.0000000000000000'
hints:
  - AVG ignores unknown amounts; keep the paid-order population explicit.
---

# Exercise: Calculate the mean of known observations

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

Compare each member key's mean paid-order amount. A repeat buyer contributes several orders to the mean, not one precomputed customer total.

## Your Task

1. Return member_id and AVG(amount) AS average_order for paid orders, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
