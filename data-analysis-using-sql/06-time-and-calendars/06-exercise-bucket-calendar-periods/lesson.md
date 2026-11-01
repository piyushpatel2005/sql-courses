---
title: 'Exercise: bucket calendar months without losing the year'
slug: exercise-bucket-calendar-periods
order: 6
language: sql
runtime: sql
lesson_type: coding
summary: Group timestamps by a month boundary that retains the year.
seo_title: 'Exercise: bucket calendar months without losing the year | Data Analysis Using SQL'
seo_description: Group timestamps by a month boundary that retains the year.
seo_keywords:
- SQL analysis
- exercise bucket calendar periods
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - month
  - paid_orders
  - gross
  expected_rows:
  - - '2025-01-01'
    - 2
    - '100.00'
  - - '2025-02-01'
    - 3
    - '140.00'
  - - '2025-03-01'
    - 5
    - '270.00'
  expected_row_count: 3
hints:
- DATE_TRUNC produces a complete month key; a month number alone would merge years.
---

# Exercise: bucket calendar months without losing the year

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

Build a UTC monthly paid-revenue report for the quarter.

Use January through March 2025 only. Keep the population filter half-open and the month definition explicitly UTC.

## Your Task

1. Return `month` as first-of-month ISO date text, `paid_orders`, and `gross`, ordered by `month`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

A month absent from this grouped result would mean no matching rows, not automatically a confirmed zero. The calendar-series lesson will make that population explicit.
