---
title: 'Exercise: Count matching rows with FILTER'
slug: exercise-conditional-denominators
order: 2
language: sql
lesson_type: coding
runtime: sql
summary: Count a qualifying subset without removing the other input rows.
seo_title: 'Exercise: Count matching rows with FILTER | Data Analysis Using SQL'
seo_description: Count a qualifying subset without removing the other input rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Count matching rows with FILTER
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - submitted
    - paid
  expected_row_count: 6
  expected_rows:
    - - 1
      - 4
      - 4
    - - 2
      - 3
      - 2
    - - 3
      - 2
      - 2
    - - 4
      - 1
      - 1
    - - 5
      - 2
      - 1
    - - 99
      - 1
      - 1
hints:
  - FILTER belongs to the paid aggregate, not to the whole query.
---

# Exercise: Count matching rows with FILTER

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

Count all submitted orders and paid orders for each member key, keeping pending and cancelled submissions visible in the first count.

## Your Task

1. Return member_id, COUNT(*) AS submitted, and the paid-only count AS paid using FILTER; order by member_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
