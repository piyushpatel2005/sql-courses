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

Build a refund-adjusted paid-order ledger that can be reconciled before anyone groups it by region.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: aggregates, views and preaggregation.

This project uses the full snapshot, not a quarter cutoff. Start with the many-row refund source. Each later join will rely on this first view having one row per order.

## Your Task

1. Create or replace `refund_by_order` with `order_id` and total `refunded`; return both columns ordered by `order_id`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

Review the two refunds on order 101. Collapsing them here is intentional because the next output grain is an order, not a refund event.
