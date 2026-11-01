---
title: 'Exercise: build a cohort from the first eligible purchase'
slug: exercise-acquisition-cohorts
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Assign members to the month of their first eligible purchase.
seo_title: 'Exercise: build a cohort from the first eligible purchase | Data Analysis Using SQL'
seo_description: Assign members to the month of their first eligible purchase.
seo_keywords:
- SQL analysis
- exercise acquisition cohorts
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - cohort
  - cohort_size
  expected_rows:
  - - '2025-01-01'
    - 2
  - - '2025-02-01'
    - 2
  - - '2025-03-01'
    - 1
  expected_row_count: 3
hints:
- Find each first paid timestamp before grouping people by its month.
---

# Exercise: build a cohort from the first eligible purchase

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `members`

One row represents one registered member.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `member_id` · `integer` | Registered-member identifier, distinct from an import receipt or text member_key. | Primary key; unique. Required; cannot be `NULL`. |
| `region` · `text` | Current member region, not the region at the date of a past purchase. | Nullable; `NULL` means the current region is unrecorded. |
| `joined_on` · `date` | Registration calendar date, without a time of day or time zone. | Required; cannot be `NULL`. |
| `channel` · `text` | Recorded acquisition channel, such as search or referral; not a causal explanation of behavior. | Nullable; `NULL` means acquisition attribution is unknown. |

Region and channel labels are not enforced enumerations. This current-member dimension has no region-change history.

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

#### `first_paid`

One row represents one registered purchaser.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `member_id` · `integer` | Identity used to group eligible paid purchases. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique group key, not a physical primary key. |
| `first_at` · `timestamp with time zone` | Earliest eligible occurrence instant; interpreted in UTC for acquisition-month bucketing. | Non-NULL by query lineage, not a declared NOT NULL constraint. MIN ignores missing timestamps; the registered-purchase source requires occurrence time. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

This uses eligible prior history, not a new first purchase in each reporting month. Members without eligible purchases have no first_paid row.

### Relationship map

Aliases name query roles, not extra tables: `m` = `members`, `o` = `orders`.

![Logical Key Match: orders.member_id and members.member_id](orders-member-id-to-members-member-id-relationship-23c8cd60.svg)

Each `orders` row can match zero or one `members` rows; each `members` row can match zero or many `orders` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Count first-paid acquisition cohorts among registered members.

Use paid orders strictly before April 1, 2025 UTC and match to `members`. Member 99 has no registered record and is excluded from this member analysis. The dataset contains all prior purchases.

## Your Task

1. Return `cohort` as first-of-month ISO date text and `cohort_size`, ordered by `cohort`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

This is a count of acquired purchasers, not all registered members. The non-purchasing member does not belong in the denominator for a purchaser-retention cohort.
