---
title: 'Quarter review 2: apply the refund cutoff once'
slug: project-quarter-review-stage-2
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Add refunds known at the report cutoff without multiplying orders or borrowing information from April.
seo_title: 'Quarter review 2: apply the refund cutoff once | Data Analysis Using SQL'
seo_description: Add refunds known at the report cutoff without multiplying orders or borrowing information from April.
seo_keywords:
- SQL analysis
- project quarter review stage 2
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - gross
  - refunded
  - net
  expected_rows:
  - - 202
    - '120.00'
    - '15.00'
    - '105.00'
  - - 203
    - '60.00'
    - '0'
    - '60.00'
  - - 204
    - '60.00'
    - '10.00'
    - '50.00'
  - - 205
    - '80.00'
    - '0'
    - '80.00'
  - - 206
    - '40.00'
    - '0'
    - '40.00'
  - - 208
    - '100.00'
    - '20.00'
    - '80.00'
  - - 209
    - '30.00'
    - '0'
    - '30.00'
  - - 210
    - '50.00'
    - '0'
    - '50.00'
  expected_row_count: 8
hints:
- Filter refunds inside their aggregate CTE, then left join to quarter_paid.
---

# Quarter review 2: apply the refund cutoff once

Add refunds known at the report cutoff without multiplying orders or borrowing information from April.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Quarter review 1; refund preaggregation, left joins, COALESCE and timestamp filters.

Sum refunds per order only when refunded_at is strictly before the as-of instant. Then attach that summary to quarter_paid. Two refunds on order 202 both count. The April refund on order 205 does not count yet. Keep the cutoff fixed when rerunning this supplied snapshot. The view itself does not freeze source data; the historical interpretation also depends on the snapshot assumptions from stage 1.

## Your Task

1. Create or replace `quarter_net` retaining the prior order fields and adding `refunded` and `net`. Return `order_id`, `gross`, `refunded`, and `net`, ordered by order ID.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

At order grain, gross minus refunded must equal net. Do not filter refund dates in the outer WHERE clause: that would remove orders with no refund.
