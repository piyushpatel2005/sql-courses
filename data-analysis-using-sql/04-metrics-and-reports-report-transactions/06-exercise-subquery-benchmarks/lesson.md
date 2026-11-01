---
title: 'Exercise: compare a row with a computed benchmark'
slug: exercise-subquery-benchmarks
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Compare paid orders with a mean computed from the same population.
seo_title: 'Exercise: compare a row with a computed benchmark | Data Analysis Using SQL'
seo_description: Compare paid orders with a mean computed from the same population.
seo_keywords:
- SQL analysis
- exercise subquery benchmarks
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - amount
  expected_rows:
  - - 102
    - '60.00'
  - - 104
    - '80.00'
  - - 107
    - '100.00'
  - - 108
    - '80.00'
  - - 112
    - '70.00'
  expected_row_count: 5
hints:
- Keep the paid-status condition in both the outer and inner queries.
---

# Exercise: compare a row with a computed benchmark

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

Find paid orders above the paid-order mean.

Use the full snapshot. The comparison must ignore pending and cancelled orders in both the outer population and the benchmark.

## Your Task

1. Return `order_id` and `amount` for paid orders strictly above the mean paid amount, ordered by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Strictly above means `>`, not `>=`. Equal-to-average values should not enter an above-average report.
