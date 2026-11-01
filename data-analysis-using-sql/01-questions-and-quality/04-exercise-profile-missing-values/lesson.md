---
title: 'Exercise: profile missing values without hiding them'
slug: exercise-profile-missing-values
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Measure how many source amounts are known before calculating a metric.
seo_title: 'Exercise: profile missing values without hiding them | Data Analysis Using SQL'
seo_description: Measure how many source amounts are known before calculating a metric.
seo_keywords:
- SQL analysis
- exercise profile missing values
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - orders_seen
  - known_amounts
  - missing_amounts
  expected_rows:
  - - 13
    - 12
    - 1
  expected_row_count: 1
hints:
- Subtract COUNT(amount) from COUNT(*) to expose missing values.
---

# Exercise: profile missing values without hiding them

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

Measure the coverage of order amounts.

Include every status and every date. This is a source-quality profile, not a paid-revenue report.

## Your Task

1. Return one row with `orders_seen`, `known_amounts`, and `missing_amounts`, using row count, non-null amount count, and their difference.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Keep the missing amount visible. The pending order is a data-quality counterexample, not permission to treat unknown money as zero.
