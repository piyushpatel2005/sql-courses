---
title: 'Refund project 2: preserve the paid-order population'
slug: project-refund-ledger-stage-2
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Attach refunds to paid orders and retain the order key so the ledger can still be traced back to its source.
seo_title: 'Refund project 2: preserve the paid-order population | Data Analysis Using SQL'
seo_description: Attach refunds to paid orders and retain the order key so the ledger can still be traced back to its source.
seo_keywords:
- SQL analysis
- project refund ledger stage 2
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - gross
  - refunded
  - net
  expected_rows:
  - - 101
    - 1
    - '40.00'
    - '8.00'
    - '32.00'
  - - 102
    - 2
    - '60.00'
    - '0'
    - '60.00'
  - - 103
    - 1
    - '40.00'
    - '0'
    - '40.00'
  - - 104
    - 3
    - '80.00'
    - '10.00'
    - '70.00'
  - - 106
    - 4
    - '20.00'
    - '0'
    - '20.00'
  - - 107
    - 1
    - '100.00'
    - '20.00'
    - '80.00'
  - - 108
    - 3
    - '80.00'
    - '0'
    - '80.00'
  - - 109
    - 5
    - '30.00'
    - '0'
    - '30.00'
  - - 110
    - 99
    - '50.00'
    - '0'
    - '50.00'
  - - 112
    - 2
    - '70.00'
    - '0'
    - '70.00'
  - - 113
    - 1
    - '10.00'
    - '0'
    - '10.00'
  expected_row_count: 11
hints:
- Start from paid orders and left join refund_by_order.
---

# Refund project 2: preserve the paid-order population

Attach refunds to paid orders and retain the order key so the ledger can still be traced back to its source.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Refund project 1; left joins, COALESCE, arithmetic and views.

The right side is now unique by order ID. A left join keeps paid orders with no refund. Zero is justified here because the complete supplied refund snapshot has no recorded event for those orders.

## Your Task

1. Create or replace `paid_ledger` with `order_id`, `member_id`, `gross`, `refunded`, and `net`; return those columns ordered by `order_id`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

Before rolling this up, compare the ledger row count with the paid-order source count. A change in that count signals a join or filter problem.
