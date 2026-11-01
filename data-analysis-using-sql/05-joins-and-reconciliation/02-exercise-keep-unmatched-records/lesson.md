---
title: 'Exercise: make unmatched records visible'
slug: exercise-keep-unmatched-records
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Attach region labels without losing paid orders whose member is missing.
seo_title: 'Exercise: make unmatched records visible | Data Analysis Using SQL'
seo_description: Attach region labels without losing paid orders whose member is missing.
seo_keywords:
- SQL analysis
- exercise keep unmatched records
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - order_id
  - member_id
  - region
  expected_rows:
  - - 101
    - 1
    - North
  - - 102
    - 2
    - South
  - - 103
    - 1
    - North
  - - 104
    - 3
    - North
  - - 106
    - 4
    - West
  - - 107
    - 1
    - North
  - - 108
    - 3
    - North
  - - 109
    - 5
    - South
  - - 110
    - 99
    - unmatched
  - - 112
    - 2
    - South
  - - 113
    - 1
    - North
  expected_row_count: 11
hints:
- Keep orders on the left and filter their status, not the optional member row.
---

# Exercise: make unmatched records visible

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

Aliases name query roles, not extra tables: `o` = `orders`, `m` = `members`.

![Logical Key Match: members.member_id and orders.member_id](members-member-id-to-orders-member-id-relationship-a7b3a0c2.svg)

Each `members` row can match zero or many `orders` rows; each `orders` row can match zero or one `members` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Attach region labels to paid orders while retaining missing members.

Use all paid orders, including the order whose member key has no registered match.

Every matched member in this snapshot has a known region, so `COALESCE(m.region, 'unmatched')` labels the missing match correctly here. In a source with nullable regions, use `m.member_id IS NULL` to distinguish an absent member from a present member whose region is unknown.

## Your Task

1. Return `order_id`, `member_id` from orders, and `region` with missing matches labeled `unmatched`; order by `order_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

Check that the unmatched paid order remains. An inner join would change the paid-order population.
