---
title: Prevent join fanout with preaggregation
slug: preaggregate-before-joining
order: 3
language: sql
runtime: sql
lesson_type: interactive
summary: Calculate net amounts without repeating an order for each refund.
seo_title: Prevent join fanout with preaggregation | Data Analysis Using SQL
seo_description: Calculate net amounts without repeating an order for each refund.
seo_keywords:
- SQL analysis
- preaggregate before joining
- PostgreSQL
sql:
  seed: seed.sql
---

# Prevent join fanout with preaggregation

In this separate order example, two refunds must become one order-level total before the join. The runnable bill example below uses different amounts.

![Aggregate the child at order grain; do not repeat the parent amount.](refund-preaggregation.svg)

Two child tables can multiply each other when joined through a parent. Put each source at the intended output grain before combining totals.

If one invoice has two items and three payments, joining both children produces six pairs. Summing an invoice amount across those pairs repeats it six times. `SUM(DISTINCT amount)` is not a repair: two legitimate invoices can have equal amounts.

Aggregate each child to one row per parent key first. Then join those summaries to the parent. A missing child summary can mean no recorded activity; use `COALESCE(total, 0)` only when that interpretation is justified. State each intermediate grain in a comment while building the query.

## Read and run

A workshop has two bills with equal totals; one bill has two separate rebates.

```sql run
WITH rebate_totals AS (
  SELECT bill, SUM(value) AS rebate
  FROM rebates GROUP BY bill
)
SELECT b.bill, b.total - COALESCE(r.rebate, 0) AS net
FROM bills b LEFT JOIN rebate_totals r ON r.bill = b.bill
ORDER BY b.bill;
```

Each bill appears once, including the bill with no rebates. The equal gross amounts remain separate. Reducing rebates to one row per bill prevents the parent total from being repeated.

Another rebate for bill 81 should change its net amount, not the number of bill rows. Check both when reviewing a join.
