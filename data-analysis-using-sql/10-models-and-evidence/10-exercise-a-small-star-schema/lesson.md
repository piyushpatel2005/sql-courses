---
title: 'Exercise: model a report with facts and dimensions'
slug: exercise-a-small-star-schema
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Separate order measurements from current member descriptions.
seo_title: 'Exercise: model a report with facts and dimensions | Data Analysis Using SQL'
seo_description: Separate order measurements from current member descriptions.
seo_keywords:
- SQL analysis
- exercise a small star schema
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - member_id
  - paid_orders
  - gross
  expected_rows:
  - - 1
    - 4
    - '190.00'
  - - 2
    - 2
    - '130.00'
  - - 3
    - 2
    - '160.00'
  - - 4
    - 1
    - '20.00'
  - - 5
    - 1
    - '30.00'
  expected_row_count: 5
hints:
- Load only matching member keys before enforcing the reporting foreign key.
---

# Exercise: model a report with facts and dimensions

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

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `fact_paid_orders`

One row represents one stored paid-order fact.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `order_id` · `integer` | Unique order identifier at order grain. | Primary key; unique. Required; cannot be `NULL`. |
| `member_id` · `integer` | Nullable enforced member reference; the supplied load selects only matching registered members. | Nullable; `NULL` means the identifier or reference is unrecorded. Declared FOREIGN KEY (member_id) REFERENCES members(member_id). |
| `gross` · `numeric(10,2)` | Whole-order gross USD before refunds, copied from the paid source order. | Nullable; `NULL` means the gross measure is unrecorded, not zero. |

The schema permits a NULL member reference and amount even though the supplied load has known matched values. Orphan source orders are excluded by the load, not repaired by the foreign key.

### Relationship map

Aliases name query roles, not extra tables: `o` = `orders`, `m` = `members`.

![Logical Key Match: members.member_id and orders.member_id](members-member-id-to-orders-member-id-relationship-a7b3a0c2.svg)

Each `members` row can match zero or many `orders` rows; each `orders` row can match zero or one `members` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

![Foreign-Key Relationship: fact_paid_orders.member_id and members.member_id](fact-paid-orders-member-id-to-members-member-id-relationship-bec9e812.svg)

Each `fact_paid_orders` row can match zero or one `members` rows; each `members` row can match zero or many `fact_paid_orders` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is an enforced foreign key: every non-NULL child reference must match exactly one existing parent, while a NULL child reference may have no parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Build and inspect a paid-order fact table at order grain.

The existing `members` table is the current-member dimension. Include paid orders with a matching member across the full snapshot. Define `fact_paid_orders(order_id integer PRIMARY KEY, member_id integer REFERENCES members(member_id), gross numeric(10,2))`.

## Your Task

1. Create and populate `fact_paid_orders`, then return `member_id`, `paid_orders`, and `gross` aggregated from that table, ordered by `member_id`.

Replace the preview in `script.sql`. Run your query, check the returned rows, then Submit.

The final result is graded, not the table constraints themselves. Use the stated keys and foreign key to practice the model. Explain the excluded member-99 order before comparing this total with an all-order report.
