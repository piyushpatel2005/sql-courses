---
title: 'Exercise: rank a review queue without erasing ties'
slug: exercise-rank-a-review-queue
order: 17
language: sql
runtime: sql
lesson_type: coding
summary: Keep every order at the two highest distinct amount levels.
seo_title: 'Exercise: rank a review queue without erasing ties | Data Analysis Using SQL'
seo_description: Keep every order at the two highest distinct amount levels.
seo_keywords:
  - SQL analysis
  - exercise rank a review queue
  - PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - order_id
    - amount
    - amount_level
  expected_rows:
    - - 107
      - '100.00'
      - 1
    - - 104
      - '80.00'
      - 2
    - - 108
      - '80.00'
      - 2
  expected_row_count: 3
hints:
  - Compute DENSE_RANK in a CTE, then filter its result outside the window query.
---

# Exercise: select the two highest amount levels

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

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `ranked`

One row represents one paid order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; equal order totals still belong to separate orders. | Non-NULL by query lineage, not a declared NOT NULL constraint. Inherited source value; source nullability is unchanged. |
| `amount` · `numeric(10,2)` | Whole-order gross amount in USD before refunds, not a unit price or an order-line amount. | May be `NULL` under its source or expression policy. Inherited source value; source nullability is unchanged. |
| `amount_level` · `bigint` | Computed distinct descending value level. | Non-NULL by query lineage, not a declared NOT NULL constraint. Non-NULL window result; no physical key or CHECK is created. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

All exposed columns are listed, including fields retained by SELECT *. This statement-local result does not create table constraints.

The repair desk will review every paid order at one of the two highest distinct amounts. A tie can make this more than two orders. Use the DENSE_RANK behavior already practiced; the new task is to filter a computed rank in an outer query.

## Your Task

1. Return order_id, amount and amount_level for paid orders with DENSE_RANK at most 2, ranked by amount descending. Display by amount descending, then order_id.

Replace `script.sql` with your report. Run it to inspect the tied values, then Submit to check the result.
