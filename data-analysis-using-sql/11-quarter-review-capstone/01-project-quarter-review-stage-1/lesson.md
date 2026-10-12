---
title: 'Quarter review 1: freeze the report population'
slug: project-quarter-review-stage-1
order: 1
language: sql
runtime: sql
lesson_type: coding
summary: Prepare the January–March 2025 board report for the Beacon tool library, using a new independently seeded snapshot.
seo_title: 'Quarter review 1: freeze the report population | Data Analysis Using SQL'
seo_description: Prepare the January–March 2025 board report for the Beacon tool library, using a new independently seeded snapshot.
seo_keywords:
- SQL analysis
- project quarter review stage 1
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - gross
  expected_rows:
  - - 202
    - 21
    - '120.00'
  - - 203
    - 22
    - '60.00'
  - - 204
    - 23
    - '60.00'
  - - 205
    - 21
    - '80.00'
  - - 206
    - 24
    - '40.00'
  - - 208
    - 23
    - '100.00'
  - - 209
    - 25
    - '30.00'
  - - 210
    - 999
    - '50.00'
  expected_row_count: 8
hints:
- Include January 1 midnight; exclude April 1 midnight and the December order.
---

# Quarter review 1: freeze the report population

![Both report paths must reconcile to the same net ledger under the fixed cutoff.](quarter-report-lineage.svg)

Prepare the January–March 2025 board report for the Beacon tool library, using a new independently seeded snapshot.

## Project continuity

This starts a new report. The seed contains the source snapshot only.

Prerequisites: paid-population definitions, timestamp boundaries, views and transactions.

The board needs net paid-order revenue by order month and current member region. The as-of cutoff is April 1, 2025 00:00 UTC. This is an order-cohort revenue report, not a cash-flow statement: refunds known before the cutoff are assigned back to the original order.

The capstone uses `members`, `orders`, and `refunds` with the same column meanings as the course dictionary but new IDs and values. The seed includes an order just before the quarter, another exactly at its end, a pending unknown amount, an orphan member key 999, and a refund after the cutoff. Keep these counterexamples visible during your checks.

For this fixed snapshot, assume order status and amount reflect the cutoff, and that each refund was recorded when it occurred. There is no receipt timestamp or revision history in these tables. Filtering dates on a changing live source would not reconstruct what was known on April 1: a late refund or a later status correction could change the answer. A historical report needs a preserved snapshot or enough change history to apply its knowledge cutoff.

## Your Task

1. Create or replace `quarter_paid` with `order_id`, `member_id`, `placed_at`, and `gross` for paid orders in the half-open UTC quarter. Return `order_id`, `member_id`, and `gross` ordered by order ID.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

Write down the population before proceeding: order grain, paid status, UTC quarter, and no member-match exclusion. The next stage must preserve exactly these order IDs.
