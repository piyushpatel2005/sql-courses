---
title: 'Exercise: Round a numeric report value'
slug: exercise-round-a-report
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Round an aggregate result rather than every input amount.
seo_title: 'Exercise: Round a numeric report value | Data Analysis Using SQL'
seo_description: Round an aggregate result rather than every input amount.
seo_keywords:
  - SQL
  - PostgreSQL
  - Round a numeric report value
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - average_order
  expected_row_count: 6
  expected_rows:
    - - 1
      - '47.50'
    - - 2
      - '65.00'
    - - 3
      - '80.00'
    - - 4
      - '20.00'
    - - 5
      - '30.00'
    - - 99
      - '50.00'
hints:
  - Apply ROUND after AVG so intermediate precision is preserved.
---

# Exercise: Round a numeric report value

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

The club wants a two-decimal mean paid amount for each member key. Use all paid orders.

## Your Task

1. Return member_id and ROUND(AVG(amount), 2) AS average_order, grouped and ordered by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
