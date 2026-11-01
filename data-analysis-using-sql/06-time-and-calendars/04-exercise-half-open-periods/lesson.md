---
title: 'Exercise: Keep adjacent time periods separate'
slug: exercise-half-open-periods
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Keep adjacent reporting periods from sharing a boundary instant.
seo_title: 'Exercise: Keep adjacent time periods separate | Data Analysis Using SQL'
seo_description: Keep adjacent reporting periods from sharing a boundary instant.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep adjacent time periods separate
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - local_day
  expected_row_count: 10
  expected_rows:
    - - 101
      - '2025-01-05'
    - - 102
      - '2025-01-31'
    - - 103
      - '2025-01-31'
    - - 104
      - '2025-02-10'
    - - 106
      - '2025-02-28'
    - - 107
      - '2025-02-28'
    - - 108
      - '2025-03-02'
    - - 109
      - '2025-03-02'
    - - 110
      - '2025-03-03'
    - - 113
      - '2025-03-05'
hints:
  - Use >= for the start and < for the next period's start.
---

# Exercise: Keep adjacent time periods separate

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

Inspect paid orders in the January–March UTC quarter and display each retained order date in New York. April 1 midnight is outside the quarter.

## Your Task

1. Return order_id and local_day as ISO date text under the inclusive January 1 and exclusive April 1, 2025 UTC filter, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
