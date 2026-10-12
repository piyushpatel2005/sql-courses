---
title: 'Exercise: reconcile independent sources and name the limits'
slug: exercise-reconcile-independent-totals
order: 12
language: sql
runtime: sql
lesson_type: coding
summary: Compare independent totals without hiding unmatched keys.
seo_title: 'Exercise: reconcile independent sources and name the limits | Data Analysis Using SQL'
seo_description: Compare independent totals without hiding unmatched keys.
seo_keywords:
- SQL analysis
- exercise reconcile independent totals
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - order_gross
  - line_gross
  - difference
  expected_rows:
  - - 101
    - '40.00'
    - '40.00'
    - '0.00'
  - - 102
    - '60.00'
    - '60.00'
    - '0.00'
  - - 103
    - '40.00'
    - '40.00'
    - '0.00'
  - - 104
    - '80.00'
    - '80.00'
    - '0.00'
  - - 106
    - '20.00'
    - '20.00'
    - '0.00'
  - - 107
    - '100.00'
    - '100.00'
    - '0.00'
  - - 108
    - '80.00'
    - '78.00'
    - '2.00'
  - - 109
    - '30.00'
    - '30.00'
    - '0.00'
  - - 110
    - '50.00'
    - '50.00'
    - '0.00'
  - - 112
    - '70.00'
    - '70.00'
    - '0.00'
  - - 113
    - '10.00'
    - '10.00'
    - '0.00'
  expected_row_count: 11
hints:
- Aggregate lines first, then use a full join to retain either source's order key.
---

# Exercise: reconcile independent sources and name the limits

Check paid order amounts against independently summed order lines.

Use the full paid-order snapshot and all line totals. Line amounts are whole-line USD, so do not multiply them by units. For this check, absent-side totals display as zero, while the separate source columns remain null.

## Your Task

1. Return `order_id`, `order_gross`, `line_gross`, and `difference` (order minus lines), keeping all keys present in either paid orders or the line summary; order by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

A row with zero difference passes this arithmetic check only. Inspect missing-side nulls separately before calling the data complete, and do not claim that a reconciliation proves every business rule.
