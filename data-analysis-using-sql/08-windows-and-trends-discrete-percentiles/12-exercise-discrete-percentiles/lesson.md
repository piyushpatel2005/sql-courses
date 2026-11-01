---
title: 'Exercise: Choose an observed percentile with PERCENTILE_DISC'
slug: exercise-discrete-percentiles
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Choose a median from the observed paid amounts.
seo_title: 'Exercise: Choose an observed percentile with PERCENTILE_DISC | Data Analysis Using SQL'
seo_description: Choose a median from the observed paid amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Choose an observed percentile with PERCENTILE_DISC
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - measured_orders
    - observed_median
  expected_row_count: 1
  expected_rows:
    - - 11
      - '50.00'
hints:
  - PERCENTILE_DISC selects a recorded value rather than interpolating.
---

# Exercise: Choose an observed percentile with PERCENTILE_DISC

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

Report a median that is an observed paid amount, rather than an interpolated value. Keep the known-order count beside it.

## Your Task

1. Return measured_orders and observed_median, using PERCENTILE_DISC(0.5) on paid amounts and rounding its numeric result to two decimals.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
