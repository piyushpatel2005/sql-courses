---
title: 'Quarter review 4: a monthly trend with a stable definition'
slug: project-quarter-review-stage-4
order: 4
language: sql
runtime: sql
lesson_type: coding
summary: Add a complete monthly net-revenue trend using the same order population and refund policy as the regional table.
seo_title: 'Quarter review 4: a monthly trend with a stable definition | Data Analysis Using SQL'
seo_description: Add a complete monthly net-revenue trend using the same order population and refund policy as the regional table.
seo_keywords:
- SQL analysis
- project quarter review stage 4
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - month
  - paid_orders
  - net
  - running_net
  - change_net
  expected_rows:
  - - '2025-01-01'
    - 3
    - '215.00'
    - '215.00'
    - null
  - - '2025-02-01'
    - 2
    - '120.00'
    - '335.00'
    - '-95.00'
  - - '2025-03-01'
    - 3
    - '160.00'
    - '495.00'
    - '40.00'
  expected_row_count: 3
hints:
- Calculate windows over the complete monthly view, not over individual orders.
---

# Quarter review 4: a monthly trend with a stable definition

Add a complete monthly net-revenue trend using the same order population and refund policy as the regional table.

## Project continuity

This is stage 4 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Quarter review 1–3; monthly date spines, views, LAG and explicit window frames.

Group by the UTC order month, not the refund month. Fill the three-month calendar and preserve month as a date in quarter_months. Display a running quarter total and an absolute change from the previous month. The first month has no previous month inside this report, so its change is null.

## Your Task

1. Create or replace `quarter_months` with date `month`, `paid_orders`, and `net`. Return `month` as ISO text, `paid_orders`, `net`, `running_net`, and `change_net`, ordered by month.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The last running total should equal the sum of regional net amounts. A monthly increase is observed activity, not evidence that a campaign caused growth; the snapshot contains no controlled comparison.
