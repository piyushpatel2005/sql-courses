---
title: 'Exercise: Define both sides of a rate'
slug: exercise-rate-denominators
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Calculate a paid-order share from an explicit numerator and denominator.
seo_title: 'Exercise: Define both sides of a rate | Data Analysis Using SQL'
seo_description: Calculate a paid-order share from an explicit numerator and denominator.
seo_keywords:
  - SQL
  - PostgreSQL
  - Define both sides of a rate
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - submitted
    - paid
    - paid_pct
  expected_row_count: 6
  expected_rows:
    - - 1
      - 4
      - 4
      - '100.00'
    - - 2
      - 3
      - 2
      - '66.67'
    - - 3
      - 2
      - 2
      - '100.00'
    - - 4
      - 1
      - 1
      - '100.00'
    - - 5
      - 2
      - 1
      - '50.00'
    - - 99
      - 1
      - 1
      - '100.00'
hints:
  - Divide the paid count by all submissions and guard a zero denominator.
---

# Exercise: Define both sides of a rate

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

Report the share of all submitted orders that were paid, using the full snapshot and keeping counts beside the rate.

## Your Task

1. Return member_id, submitted, paid, and paid_pct rounded to two decimals. Use all orders as denominator and guard division by zero. Order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
