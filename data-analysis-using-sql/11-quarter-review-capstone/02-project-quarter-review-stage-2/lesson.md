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

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `orders`

One row represents one submitted order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; equal order totals still belong to separate orders. | Primary key; unique. Required; cannot be `NULL`. |
| `member_id` · `integer` | Member key used to look up a registered member; no foreign key is declared. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `placed_at` · `timestamp with time zone` | Order occurrence instant, interpreted in UTC unless the query explicitly chooses a local reporting zone. | Nullable; `NULL` means occurrence time is unrecorded. |
| `status` · `text` | Order status: paid, pending and cancelled occur in the snapshot; paid defines revenue eligibility. | Nullable; `NULL` means no status value is recorded. |
| `amount` · `numeric(10,2)` | Whole-order gross amount in USD before refunds, not a unit price or an order-line amount. | Nullable; `NULL` means the order gross amount is unknown, not zero. |
| `coupon` · `text` | Optional coupon code recorded on the order. | Nullable; `NULL` means no coupon code is recorded. |

The status labels are observed values, not a CHECK constraint. Paid amounts are known in this supplied snapshot; the nullable column also contains an unknown pending amount. No nonnegative-amount rule or member foreign key is declared. An orphan member key is a real order, not a member registration. The supplied orphan key is 999.

#### `quarter_paid`

One row represents one paid order in the fixed January–March 2025 UTC quarter.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identity inherited unchanged from orders.order_id. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique non-NULL key inherited from the base primary key; no view primary key is declared. |
| `member_id` · `integer` | Member key inherited from the order; it may be missing or unmatched. | May be `NULL` under its source or expression policy. |
| `placed_at` · `timestamp with time zone` | Original order occurrence instant, retained for UTC order-month bucketing. | Non-NULL by query lineage, not a declared NOT NULL constraint. The quarter predicate excludes NULL instants even though the capstone source permits them. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, inherited from orders.amount. | May be `NULL` under its source or expression policy. The base amount is nullable; known paid sample values do not make the view enforce NOT NULL. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

Target or restored view over a supplied fixed snapshot, not a materialized or historically frozen table. Member matching is not part of this population; orphan money remains.

#### `refunds`

One row represents one refund event, not one refunded order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `refund_id` · `integer` | Refund-event identifier; an order can have several different refund IDs. | Primary key; unique. Required; cannot be `NULL`. |
| `order_id` · `integer` | Logical parent order identifier; not a declared foreign key. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `refunded_at` · `timestamp with time zone` | Refund occurrence instant, interpreted in UTC for cutoff tests; no separate receipt time is stored. | Nullable; `NULL` means refund occurrence time is unrecorded. |
| `amount` · `numeric(10,2)` | USD amount returned by this one refund event, not the original order gross amount. | Nullable; `NULL` means the event refund amount is unknown, not zero. |

Supplied refund amounts are known and positive, but the schema permits NULL and does not enforce positivity. Sum events to order grain before attaching them to an order total. No receipt/version history exists to reconstruct late knowledge on a changing source.

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `quarter_net`

One row represents one quarter-paid order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identity inherited unchanged from orders.order_id. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique non-NULL key inherited from the base primary key; no view primary key is declared. |
| `member_id` · `integer` | Member key inherited from the order; it may be missing or unmatched. | May be `NULL` under its source or expression policy. |
| `placed_at` · `timestamp with time zone` | Original order occurrence instant, retained for UTC order-month bucketing. | Non-NULL by query lineage, not a declared NOT NULL constraint. The quarter predicate excludes NULL instants even though the capstone source permits them. |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, inherited from orders.amount. | May be `NULL` under its source or expression policy. The base amount is nullable; known paid sample values do not make the view enforce NOT NULL. |
| `refunded` · `numeric` | Total recorded refund USD for this order after any stated cutoff, with absent summaries displayed as zero. | Non-NULL by query lineage, not a declared NOT NULL constraint. COALESCE makes the output non-NULL; it does not impose a physical constraint or prove source completeness. |
| `net` · `numeric` | Order gross USD minus its aggregated refunded USD. | May be `NULL` under its source or expression policy. A missing gross amount propagates to net; known sample net amounts do not create a NOT NULL constraint. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

Refunds before the April 1, 2025 UTC cutoff are assigned back to the original order. This is order-cohort net revenue, not refund-month cash flow. Historical knowledge relies on a preserved snapshot and the stated recording assumptions, not on the view freezing history.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `refund_totals`

One row represents one order key with eligible refund events.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Refund-source order key used for grouping. | May be `NULL` under its source or expression policy. Logical unique group key, including at most one NULL group; not a physical primary key. |
| `refunded` · `numeric` | Sum of refund-event amounts in USD for this order key. | May be `NULL` under its source or expression policy. SUM ignores unknown amounts and is NULL if all amounts in a group are unknown. No declared precision or scale. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

Only refund occurrences before April 1, 2025 UTC enter this summary. Grouped keys are logically unique, not physical primary keys; NULL grouping remains possible.

### Relationship map

Aliases name query roles, not extra tables: `p` = `quarter_paid`, `r` = `refund_totals`.

![Logical Key Match: refund_totals.order_id and quarter_paid.order_id](refund-totals-order-id-to-quarter-paid-order-id-relationship-859bc9b6.svg)

Each `refund_totals` row can match zero or one `quarter_paid` rows; each `quarter_paid` row can match zero or one `refund_totals` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

![Logical Key Match: refunds.order_id and orders.order_id](refunds-order-id-to-orders-order-id-relationship-d653d2aa.svg)

Each `refunds` row can match zero or one `orders` rows; each `orders` row can match zero or many `refunds` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Add refunds known at the report cutoff without multiplying orders or borrowing information from April.

## Project continuity

This is stage 2 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Quarter review 1; refund preaggregation, left joins, COALESCE and timestamp filters.

Sum refunds per order only when refunded_at is strictly before the as-of instant. Then attach that summary to quarter_paid. Two refunds on order 202 both count. The April refund on order 205 does not count yet. Keep the cutoff fixed when rerunning this supplied snapshot. The view itself does not freeze source data; the historical interpretation also depends on the snapshot assumptions from stage 1.

## Your Task

1. Create or replace `quarter_net` retaining the prior order fields and adding `refunded` and `net`. Return `order_id`, `gross`, `refunded`, and `net`, ordered by order ID.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

At order grain, gross minus refunded must equal net. Do not filter refund dates in the outer WHERE clause: that would remove orders with no refund.
