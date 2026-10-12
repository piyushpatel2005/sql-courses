---
title: 'Quarter review 3: regional evidence with an unmatched bucket'
slug: project-quarter-review-stage-3
order: 3
language: sql
runtime: sql
lesson_type: coding
summary: Build the board's regional table while distinguishing paid orders from distinct registered buyers.
seo_title: 'Quarter review 3: regional evidence with an unmatched bucket | Data Analysis Using SQL'
seo_description: Build the board's regional table while distinguishing paid orders from distinct registered buyers.
seo_keywords:
- SQL analysis
- project quarter review stage 3
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - region
  - paid_orders
  - registered_buyers
  - gross
  - refunded
  - net
  expected_rows:
  - - East
    - 3
    - 2
    - '260.00'
    - '15.00'
    - '245.00'
  - - Hill
    - 1
    - 1
    - '30.00'
    - '0'
    - '30.00'
  - - Lake
    - 3
    - 2
    - '200.00'
    - '30.00'
    - '170.00'
  - - unmatched
    - 1
    - 0
    - '50.00'
    - '0'
    - '50.00'
  expected_row_count: 4
hints:
- Use COALESCE(m.region,'unmatched') for display and count the matched member key distinctly.
---

# Quarter review 3: regional evidence with an unmatched bucket

Build the board's regional table while distinguishing paid orders from distinct registered buyers.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Quarter review 1–2; left joins, grouped counts and DISTINCT from retention.

Use current region from the member dimension. `COUNT(DISTINCT m.member_id)` counts registered buyers once and ignores the null key on unmatched orders. This is a known-member count, not an estimate of how many people generated orphan orders. Preserve the unmatched money in its own bucket. Historical region-at-purchase is unavailable in this snapshot.

## Your Task

1. Create or replace `quarter_regions` with `region`, `paid_orders`, `registered_buyers`, `gross`, `refunded`, and `net`. Return those columns ordered by region.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The all-region net total must still equal the order ledger total. The unmatched bucket has money but no known registered buyers, so a per-registered-buyer ratio for that bucket would be undefined.
