---
title: 'Quarter review 5: publish a reconciled evidence table'
slug: project-quarter-review-stage-5
order: 5
language: sql
runtime: sql
lesson_type: coding
summary: Finish the board report with regional shares and an explicit reconciliation check against the independently grouped monthly table.
seo_title: 'Quarter review 5: publish a reconciled evidence table | Data Analysis Using SQL'
seo_description: Finish the board report with regional shares and an explicit reconciliation check against the independently grouped monthly table.
seo_keywords:
- SQL analysis
- project quarter review stage 5
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - region
  - paid_orders
  - registered_buyers
  - net
  - net_share_pct
  - net_rank
  - reconciliation_gap
  expected_rows:
  - - East
    - 3
    - 2
    - '245.00'
    - '49.49'
    - 1
    - '0.00'
  - - Lake
    - 3
    - 2
    - '170.00'
    - '34.34'
    - 2
    - '0.00'
  - - unmatched
    - 1
    - 0
    - '50.00'
    - '10.10'
    - 3
    - '0.00'
  - - Hill
    - 1
    - 1
    - '30.00'
    - '6.06'
    - 4
    - '0.00'
  expected_row_count: 4
hints:
- Use SUM(net) OVER () for the denominator and a scalar subquery over quarter_months for the reconciliation total.
---

# Quarter review 5: publish a reconciled evidence table

Finish the board report with regional shares and an explicit reconciliation check against the independently grouped monthly table.

## Project continuity

This is stage 5 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Quarter review 1–4; full-partition windows, DENSE_RANK, scalar subqueries, NULLIF and CASE.

Regional share uses all regional net amounts, including unmatched orders, as its denominator. Keep the counts beside each share. Compare that denominator with SUM(net) from quarter_months; the difference should be zero. This reconciliation uses the same ledger but two independent grouping paths, so it catches some reporting mistakes, not upstream ledger errors.

Before sharing the result, draft a short note outside the SQL editor with: the period and as-of cutoff; the largest observed regional net amount; the unmatched-data limitation; and one follow-up question. Do not claim the region caused higher spending. The note is a reflection, not an automatically graded output.

## Your Task

1. Return `region`, `paid_orders`, `registered_buyers`, `net`, two-decimal `net_share_pct`, `net_rank` using DENSE_RANK descending by net, and `reconciliation_gap` equal to all-region net minus all-month net. Order by net descending, then region.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The board now has a traceable quarter report with its population, refund policy, counts, time trend, and quality caveats. The next useful investigation is to resolve the unmatched member key and confirm whether current region is the right historical reporting attribute.
