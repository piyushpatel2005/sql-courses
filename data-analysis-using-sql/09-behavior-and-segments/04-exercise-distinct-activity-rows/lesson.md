---
title: 'Exercise: Reduce repeated activity to one row per combination'
slug: exercise-distinct-activity-rows
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Reduce repeated purchases to one member-month activity row.
seo_title: 'Exercise: Reduce repeated activity to one row per combination | Data Analysis Using SQL'
seo_description: Reduce repeated purchases to one member-month activity row.
seo_keywords:
  - SQL
  - PostgreSQL
  - Reduce repeated activity to one row per combination
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - member_id
    - month
  expected_row_count: 8
  expected_rows:
    - - 1
      - '2025-01-01'
    - - 1
      - '2025-02-01'
    - - 1
      - '2025-03-01'
    - - 2
      - '2025-01-01'
    - - 3
      - '2025-02-01'
    - - 3
      - '2025-03-01'
    - - 4
      - '2025-02-01'
    - - 5
      - '2025-03-01'
hints:
  - DISTINCT compares the member and month together.
---

# Exercise: Reduce repeated activity to one row per combination

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

### Relationship map

Aliases name query roles, not extra tables: `m` = `members`, `o` = `orders`.

![Logical Key Match: orders.member_id and members.member_id](orders-member-id-to-members-member-id-relationship-23c8cd60.svg)

Each `orders` row can match zero or one `members` rows; each `members` row can match zero or many `orders` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Prepare member-month activity from paid orders before the fixed April 1 cutoff. Keep only orders matched to registered members.

## Your Task

1. Return distinct member_id and UTC first-of-month date text AS month for matched paid orders before April 1, 2025 UTC, ordered by member_id then month.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
