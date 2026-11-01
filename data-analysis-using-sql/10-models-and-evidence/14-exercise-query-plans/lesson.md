---
title: 'Exercise: Inspect the proposed query plan'
slug: exercise-query-plans
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Read a proposed query plan before changing the schema.
seo_title: 'Exercise: Inspect the proposed query plan | Data Analysis Using SQL'
seo_description: Read a proposed query plan before changing the schema.
seo_keywords:
  - SQL
  - PostgreSQL
  - Inspect the proposed query plan
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - QUERY PLAN
  expected_row_count: 2
  expected_rows:
    - - Index Scan using orders_pkey on orders
    - - '  Index Cond: (order_id = 101)'
hints:
  - EXPLAIN describes planned work; ANALYZE would execute it.
---

# Exercise: Inspect the proposed query plan

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

Inspect the proposed work for a single-order lookup before changing the schema.

## Your Task

1. Return EXPLAIN (COSTS OFF) for SELECT order_id,amount FROM orders WHERE order_id=101. Leave the EXPLAIN statement last.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
