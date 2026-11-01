---
title: 'Refund project 1: one row per refunded order'
slug: project-refund-ledger-stage-1
order: 7
language: sql
runtime: sql
lesson_type: coding
summary: Build a refund-adjusted paid-order ledger that can be reconciled before anyone groups it by region.
seo_title: 'Refund project 1: one row per refunded order | Data Analysis Using SQL'
seo_description: Build a refund-adjusted paid-order ledger that can be reconciled before anyone groups it by region.
seo_keywords:
- SQL analysis
- project refund ledger stage 1
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - refunded
  expected_rows:
  - - 101
    - '8.00'
  - - 104
    - '10.00'
  - - 107
    - '20.00'
  expected_row_count: 3
hints:
- SUM(amount) by order_id produces the required join grain.
---

# Refund project 1: one row per refunded order

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `refunds`

One row represents one refund event, not one refunded order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `refund_id` · `integer` | Refund-event identifier; an order can have several different refund IDs. | Primary key; unique. Required; cannot be `NULL`. |
| `order_id` · `integer` | Logical parent order identifier; not a declared foreign key. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `refunded_at` · `timestamp with time zone` | Refund occurrence instant, interpreted in UTC for cutoff tests; no separate receipt time is stored. | Nullable; `NULL` means refund occurrence time is unrecorded. |
| `amount` · `numeric(10,2)` | USD amount returned by this one refund event, not the original order gross amount. | Nullable; `NULL` means the event refund amount is unknown, not zero. |

Supplied refund amounts are known and positive, but the schema permits NULL and does not enforce positivity. Sum events to order grain before attaching them to an order total. No receipt/version history exists to reconstruct late knowledge on a changing source.

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `refund_by_order`

One row represents one order key with at least one refund event.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Refund-source order key used for grouping. | May be `NULL` under its source or expression policy. Logical unique group key, including at most one NULL group; not a physical primary key. |
| `refunded` · `numeric` | Sum of refund-event amounts in USD for this order key. | May be `NULL` under its source or expression policy. SUM ignores unknown amounts and is NULL if all amounts in a group are unknown. No declared precision or scale. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

This full-snapshot summary has one row per order key, not one row per refund; orders with no refund events have no summary row.

Build a refund-adjusted paid-order ledger that can be reconciled before anyone groups it by region.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: aggregates, views and preaggregation.

This project uses the full snapshot, not a quarter cutoff. Start with the many-row refund source. Each later join will rely on this first view having one row per order.

## Your Task

1. Create or replace `refund_by_order` with `order_id` and total `refunded`; return both columns ordered by `order_id`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

Review the two refunds on order 101. Collapsing them here is intentional because the next output grain is an order, not a refund event.
