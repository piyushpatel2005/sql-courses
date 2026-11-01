---
title: 'Exercise: Declare an index for a filter column'
slug: exercise-index-a-report-filter
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Declare a timestamp index without promising a faster tiny-fixture query.
seo_title: 'Exercise: Declare an index for a filter column | Data Analysis Using SQL'
seo_description: Declare a timestamp index without promising a faster tiny-fixture query.
seo_keywords:
  - SQL
  - PostgreSQL
  - Declare an index for a filter column
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
  expected_row_count: 5
  expected_rows:
    - - 107
      - '100.00'
    - - 108
      - '80.00'
    - - 109
      - '30.00'
    - - 110
      - '50.00'
    - - 113
      - '10.00'
hints:
  - Keep placed_at unwrapped in the half-open range predicate.
---

# Exercise: Declare an index for a filter column

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

Prepare a timestamp index and a March paid-order query. Keep the half-open UTC window explicit.

## Your Task

1. Create orders_placed_at_idx on orders(placed_at). Return order_id,amount for paid orders from March 1 inclusive to April 1 exclusive, 2025 UTC, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
