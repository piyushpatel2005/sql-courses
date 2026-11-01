---
title: 'Exercise: Interpolate a percentile with PERCENTILE_CONT'
slug: exercise-continuous-percentiles
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Compute a continuous median that may fall between observed amounts.
seo_title: 'Exercise: Interpolate a percentile with PERCENTILE_CONT | Data Analysis Using SQL'
seo_description: Compute a continuous median that may fall between observed amounts.
seo_keywords:
  - SQL
  - PostgreSQL
  - Interpolate a percentile with PERCENTILE_CONT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - measured_orders
    - median_amount
  expected_row_count: 1
  expected_rows:
    - - 11
      - '50.00'
hints:
  - PERCENTILE_CONT uses WITHIN GROUP; cast its result before two-place rounding.
---

# Exercise: Interpolate a percentile with PERCENTILE_CONT

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

Describe the middle paid amount across the full snapshot. Count known amounts and preserve the requested percentile definition.

## Your Task

1. Return measured_orders and median_amount, using PERCENTILE_CONT(0.5) on paid amounts and rounding its numeric result to two decimals.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
