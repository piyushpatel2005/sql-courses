---
title: 'Refund project 3: reconcile the regional ledger'
slug: project-refund-ledger-stage-3
order: 9
language: sql
runtime: sql
lesson_type: coding
summary: Finish the ledger by grouping its net amounts without hiding orders whose member record is missing.
seo_title: 'Refund project 3: reconcile the regional ledger | Data Analysis Using SQL'
seo_description: Finish the ledger by grouping its net amounts without hiding orders whose member record is missing.
seo_keywords:
- SQL analysis
- project refund ledger stage 3
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - region
  - orders
  - gross
  - refunded
  - net
  expected_rows:
  - - North
    - 6
    - '350.00'
    - '38.00'
    - '312.00'
  - - South
    - 3
    - '160.00'
    - '0'
    - '160.00'
  - - West
    - 1
    - '20.00'
    - '0'
    - '20.00'
  - - unmatched
    - 1
    - '50.00'
    - '0'
    - '50.00'
  expected_row_count: 4
hints:
- Count ledger rows after joining the unique members key.
---

# Refund project 3: reconcile the regional ledger

Finish the ledger by grouping its net amounts without hiding orders whose member record is missing.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Refund projects 1–2; left joins, grouping and display labels.

Region is a member attribute. Keep the order population on the left and put unknown members in an explicit `unmatched` group. Sum the ledger measures; do not rejoin raw refunds or line items.

## Your Task

1. Return `region`, `orders`, `gross`, `refunded`, and `net` by region from `paid_ledger`, labeling absent member matches `unmatched`; order by `region`.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The desk can now trace a regional total back to its orders and refunds. The unmatched bucket is a data follow-up, not a region to silently omit from the grand total.
