---
title: 'Exercise: name analysis steps with CTEs'
slug: exercise-name-analysis-steps
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Separate a member summary from the rule that labels it.
seo_title: 'Exercise: name analysis steps with CTEs | Data Analysis Using SQL'
seo_description: Separate a member summary from the rule that labels it.
seo_keywords:
- SQL analysis
- exercise name analysis steps
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - member_id
  - gross
  - band
  expected_rows:
  - - 1
    - '190.00'
    - high
  - - 2
    - '130.00'
    - standard
  - - 3
    - '160.00'
    - high
  - - 4
    - '20.00'
    - standard
  - - 5
    - '30.00'
    - standard
  - - 99
    - '50.00'
    - standard
  expected_row_count: 6
hints:
- The CTE produces one total per member before CASE chooses a band.
---

# Exercise: name analysis steps with CTEs

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `orders`

One row represents one submitted order.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Order identifier; equal order totals still belong to separate orders. | Primary key; unique. Required; cannot be `NULL`. |
| `member_id` · `integer` | Member key used to look up a registered member; no foreign key is declared. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `placed_at` · `timestamp with time zone` | Order occurrence instant, interpreted in UTC unless the query explicitly chooses a local reporting zone. | Required; cannot be `NULL`. |
| `status` · `text` | Order status: paid, pending and cancelled occur in the snapshot; paid defines revenue eligibility. | Required; cannot be `NULL`. |
| `amount` · `numeric(10,2)` | Whole-order gross amount in USD before refunds, not a unit price or an order-line amount. | Nullable; `NULL` means the order gross amount is unknown, not zero. |
| `coupon` · `text` | Optional coupon code recorded on the order. | Nullable; `NULL` means no coupon code is recorded. |

The status labels are observed values, not a CHECK constraint. Paid amounts are known in this supplied snapshot; the nullable column also contains an unknown pending amount. No nonnegative-amount rule or member foreign key is declared. An orphan member key is a real order, not a member registration. The supplied orphan key is 99.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `totals`

One row represents one paid-order member-key group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `member_id` · `integer` | Order-source member key, including an unmatched or NULL key group. | May be `NULL` under its source or expression policy. Logical group key, not an enforced member reference. |
| `gross` · `numeric` | Sum of paid-order gross USD for this member key. | May be `NULL` under its source or expression policy. SUM is NULL for an all-unknown amount group. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

This full-snapshot summary groups order keys, not necessarily registered people.

Label member spending without repeating an aggregate expression.

First summarize paid gross amount at member-key grain. Then label a total of at least 150 as `high`, and anything below it as `standard`.

## Your Task

1. Return `member_id`, `gross`, and `band` from a named totals CTE, ordered by `member_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

These thresholds are a reporting convention, not a claim about member value. The same person could move bands if the observation window changed.
