---
title: 'Exercise: Interpret an instant in a reporting zone'
slug: exercise-reporting-time-zones
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Display an instant as a date in a named reporting zone.
seo_title: 'Exercise: Interpret an instant in a reporting zone | Data Analysis Using SQL'
seo_description: Display an instant as a date in a named reporting zone.
seo_keywords:
  - SQL
  - PostgreSQL
  - Interpret an instant in a reporting zone
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - local_day
  expected_row_count: 11
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
    - - 112
      - '2025-03-31'
    - - 113
      - '2025-03-05'
hints:
  - Apply AT TIME ZONE before converting the timestamp to a date.
---

# Exercise: Interpret an instant in a reporting zone

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

Display the local date for every paid order in the full snapshot, including April. Date display does not itself filter the population.

## Your Task

1. Return order_id and local_day as ISO date text in America/New_York for all paid orders, ordered by order_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
