---
slug: data-analysis-using-sql
image: cover.svg
prerequisites:
  - course: introduction-to-sql
    note: "Be comfortable with SELECT, filtering, joins, grouping, and reusable queries."
title: Data Analysis Using SQL
description: Build reliable SQL reports from defined populations, clean data, correct joins, calendars, windows, and behavioral metrics.
language: sql
summary: Practice analytical SQL through runnable worked examples, distinct query exercises, and five cumulative reporting projects.
seo_title: Data Analysis Using SQL
seo_description: Learn SQL analysis with windows, retention, funnels, RFM, data quality, a quarter-report capstone, and a six-stage game churn investigation.
seo_keywords:
- SQL
- data analysis
- PostgreSQL
- window functions
- cohort retention
modules:
- slug: questions-and-quality
  title: Inspect row grain and missingness
  sort_order: 1
- slug: questions-and-quality-guarded-casts
  title: Clean labels and validate numeric text
  sort_order: 2
- slug: metrics-and-reports
  title: Choose a summary measure
  sort_order: 3
- slug: metrics-and-reports-report-transactions
  title: Define rates and build an intake report
  sort_order: 4
- slug: joins-and-reconciliation
  title: Joins without inflated totals
  sort_order: 5
- slug: time-and-calendars
  title: Time boundaries and complete calendars
  sort_order: 6
- slug: windows-and-trends
  title: Partition, rank and deduplicate
  sort_order: 7
- slug: windows-and-trends-discrete-percentiles
  title: Read trends and build a daily briefing
  sort_order: 8
- slug: behavior-and-segments
  title: Cohorts, funnels, and member segments
  sort_order: 9
- slug: models-and-evidence
  title: Reporting models and trustworthy evidence
  sort_order: 10
- slug: quarter-review-capstone
  title: 'Capstone: the quarter review'
  sort_order: 11
- slug: game-churn-analysis
  title: 'Game churn: a fixed-window player investigation'
  sort_order: 12
---

# Data Analysis Using SQL

You know basic SELECT, filters, and joins. This course starts with a short practical refresh, then asks you to build reports that survive awkward data: unknown amounts, duplicate arrivals, unmatched members, ties, and exact date boundaries.

Each topic begins with a runnable worked example and continues with an editable SQL exercise on a different reporting task. Run the example, predict its behavior, then write the exercise query yourself. Use Run to inspect your result and Submit to compare its columns and rows with the report contract. The reference solution is one implementation, not the only correct SQL. Result-based checks cannot prove that you used a particular technique or created every intended constraint, so follow the named modeling and query requirements as well as the output contract.

## What you will build

- An intake-quality report in three cumulative stages after cleaning and metric definitions.
- A refund-adjusted ledger in three cumulative stages after join-grain and missing-match practice.
- A daily operations briefing in three cumulative stages after calendar and window-function practice.
- A five-stage quarter-review capstone with its own Beacon tool library snapshot, carried-forward reporting views, independent stage seeds, and a reconciled board evidence table.
- A six-stage game churn investigation after the quarter review, using a separate Lantern Trail player/event snapshot, explicit baseline eligibility, complete follow-up, and a reconciled investigation queue.

A project stage starts from the previous stage's completed script. Its seed also restores earlier views, so you can run every stage independently. Run and Submit reset a coding lesson to its supplied snapshot; your previous attempt does not change the next result. Interactive examples use their own small datasets and do not change the exercise snapshot.

## Reading the data

Most exercises use the fictional Harbor repair club. The capstone uses Beacon tool library with the same units and column meanings but different records. Demo datasets are separate illustrations, not hidden copies of the exercise answers. Some starters preview source rows; others return a `not finished` checkpoint until you replace it. You can inspect the named source tables with SELECT while exploring; restore your report as the final SELECT before submitting.

| Table | One row means | Columns and units |
|---|---|---|
| `members` | One registered member | `member_id` integer key; `region` text; `joined_on` date; nullable `channel` text |
| `orders` | One submitted repair order | `order_id` integer key; `member_id` integer (99 has no member); `placed_at` timestamp with time zone; `status` paid/cancelled/pending; nullable `amount` in USD before refunds; nullable `coupon` |
| `order_lines` | One component of an order | `line_id` key; `order_id`; `units` count; `category`; `line_amount` USD for the whole line, not per unit |
| `refunds` | One refund event | `refund_id` key; `order_id`; `refunded_at` timestamp with time zone; positive `amount` USD |
| `raw_intake` | One imported record, not necessarily one person | `import_id` unique; `member_key` may repeat; `region_text` and `fee_text` are untrusted text |
| `events` | One received event record | `ingest_id` unique; `event_id` logical event key can repeat; `member_id`; `kind` visit/book/pay; occurrence time `happened_at`; arrival time `received_at` |

An order is not an event record or an order line. Order amounts are totals, so do not multiply them by line units. The sample deliberately includes unmatched member 99, missing fees, a duplicate event, tied values and timestamps, zero-activity members, and midnight boundaries. These are teaching records, not a production ledger. In particular, events and order payments are separate sources and need not reconcile one for one.

Unless a task states another window, use the supplied full snapshot. Quarter reports use **2025-01-01 00:00 UTC inclusive to 2025-04-01 00:00 UTC exclusive**. Behavioral analyses use a fixed as-of date of **April 1, 2025**; never use today's date. Paid gross revenue excludes pending/cancelled orders. Net revenue subtracts recorded refunds under the task's stated cutoff. Unknown is not automatically zero.

## Reporting discipline

Name the question, population, row grain, units, and time cutoff before writing a metric. Preserve a path from a summary back to its input keys. Compare counts before and after joins. Keep missing values, zero values, and unobserved future periods distinct. End a finding with what the data supports and what it does not establish; an observed association is not a causal effect.

The SQL uses PostgreSQL syntax, including FILTER, date series, window frames, and ordered-set percentiles. This is an analysis course, not a database administration course. Server provisioning, permissions, backup operations, distributed warehouses, and production performance benchmarking are outside its scope. The plan and index lessons are an introduction to measurement on representative data, not a promise of a faster query on a tiny fixture.
