---
title: 'Daily briefing 3: changes with honest baselines'
slug: project-daily-briefing-stage-3
order: 15
language: sql
runtime: sql
lesson_type: coding
summary: Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.
seo_title: 'Daily briefing 3: changes with honest baselines | Data Analysis Using SQL'
seo_description: Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.
seo_keywords:
- SQL analysis
- project daily briefing stage 3
- PostgreSQL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - day
  - gross
  - running_gross
  - trailing_three_days
  - change_amount
  - change_pct
  expected_rows:
  - - '2025-03-01'
    - '100.00'
    - '100.00'
    - '100.00'
    - null
    - null
  - - '2025-03-02'
    - '110.00'
    - '210.00'
    - '210.00'
    - '10.00'
    - '10.00'
  - - '2025-03-03'
    - '50.00'
    - '260.00'
    - '260.00'
    - '-60.00'
    - '-54.55'
  - - '2025-03-04'
    - '0'
    - '260.00'
    - '160.00'
    - '-50.00'
    - '-100.00'
  - - '2025-03-05'
    - '10.00'
    - '270.00'
    - '60.00'
    - '10.00'
    - null
  expected_row_count: 5
hints:
- Use a CTE to name LAG(gross), then divide the difference by NULLIF(previous_gross,0).
---

# Daily briefing 3: changes with honest baselines

## Data model

### Exercise data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `march_daily`

One row represents one UTC day in the complete March 1–5, 2025 report.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date for one complete report day; March briefing dates use UTC. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique date from the generated spine; not a declared primary key. |
| `gross` · `numeric` | Total paid-order gross USD for this date; no activity is displayed as zero. | Non-NULL by query lineage, not a declared NOT NULL constraint. COALESCE makes the result non-NULL, including an all-NULL sum; the sample has known paid amounts and a complete feed. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

The generated calendar defines the five-day population. Missing feed coverage in another source would be unknown, not an automatic sales zero.

#### `march_trend`

One row represents one UTC day in the complete March 1–5, 2025 report.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date for one complete report day; March briefing dates use UTC. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique date from the generated spine; not a declared primary key. |
| `gross` · `numeric` | Total paid-order gross USD for this date; no activity is displayed as zero. | Non-NULL by query lineage, not a declared NOT NULL constraint. COALESCE makes the result non-NULL, including an all-NULL sum; the sample has known paid amounts and a complete feed. |
| `running_gross` · `numeric` | Paid gross USD accumulated from the first report date through this day. | Non-NULL by query lineage, not a declared NOT NULL constraint. SUM over all preceding rows and this row; each input gross is non-NULL. |
| `trailing_three_days` · `numeric` | Paid gross USD over this calendar row and up to two predecessors. | Non-NULL by query lineage, not a declared NOT NULL constraint. The first two frames are partial; one row per date makes this a daily rather than purchase-row window. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

A window projection preserves the logical unique day key; neither window column has a physical NOT NULL constraint.

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

#### `calendar`

One row represents one generated report day.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date for one complete report day; March briefing dates use UTC. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique date from the generated spine; not a declared primary key. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

GENERATE_SERIES supplies each stated boundary once, including its end. These are generated dates, not rows loaded from a calendar table.

#### `daily`

One row represents one UTC day with paid-order activity.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | UTC occurrence date of paid orders. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique grouped date; source occurrence time is required. |
| `gross` · `numeric` | Sum of paid-order gross USD on this activity date. | May be `NULL` under its source or expression policy. SUM is NULL for an all-unknown amount group; absent dates have no row here. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

This is the activity summary before calendar completion; no orders is a missing summary row, not a stored zero.

#### `changes`

One row represents one UTC day in the complete March 1–5, 2025 report.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date for one complete report day; March briefing dates use UTC. | Non-NULL by query lineage, not a declared NOT NULL constraint. Logical unique date from the generated spine; not a declared primary key. |
| `gross` · `numeric` | Total paid-order gross USD for this date; no activity is displayed as zero. | Non-NULL by query lineage, not a declared NOT NULL constraint. COALESCE makes the result non-NULL, including an all-NULL sum; the sample has known paid amounts and a complete feed. |
| `running_gross` · `numeric` | Paid gross USD accumulated from the first report date through this day. | Non-NULL by query lineage, not a declared NOT NULL constraint. SUM over all preceding rows and this row; each input gross is non-NULL. |
| `trailing_three_days` · `numeric` | Paid gross USD over this calendar row and up to two predecessors. | Non-NULL by query lineage, not a declared NOT NULL constraint. The first two frames are partial; one row per date makes this a daily rather than purchase-row window. |
| `previous_gross` · `numeric` | Gross USD from the preceding calendar row in march_trend. | May be `NULL` under its source or expression policy. LAG has no predecessor on the first report day; NULL there is an absent baseline, not zero. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

The daily key remains logically unique. An undefined percentage at a zero prior gross is separate from an absent prior day.

### Relationship map

Aliases name query roles, not extra tables: `c` = `calendar`, `d` = `daily`.

![Logical Key Match: daily.day and calendar.day](daily-day-to-calendar-day-relationship-a1da3206.svg)

Each `daily` row can match zero or one `calendar` rows; each `calendar` row can match zero or one `daily` rows. The stated keys and grouped or deduplicated grain determine these match limits; a child matching column can repeat unless its constraints or query grain make that value unique. Column names alone do not guarantee uniqueness. This is a logical query match, not a declared foreign key between these inputs. Missing or unmatched references need not have a parent.

An inner join omits nonmatches. A left join retains its left population and a full join retains both populations, using NULLs only for the missing side. These outer-join NULLs differ from unknown values stored in a real row. A one-to-many detail match repeats the other side's fields; preaggregate before summing parent-level money. An EXISTS test only asks whether a match exists and does not copy all matching child rows.

Finish the briefing by adding a daily change column without pretending the first day has a known previous-day baseline.

## Project continuity

This is stage 3 of the same report. The seed restores every earlier completed view, and the starter includes the previous stage's complete script. Keep that prefix and replace only the final preview query with this stage's work. You do not need a previous Run to make this lesson work.

Prerequisites: Daily briefing 1–2; LAG, CTEs, NULLIF and numeric rates.

Calculate previous gross from the complete daily view. A missing prior day produces null change. A zero prior day also produces an undefined percentage change, even when the absolute difference is known.

## Your Task

1. Return `day` as ISO text, `gross`, `running_gross`, `trailing_three_days`, `change_amount`, and two-decimal `change_pct`, using the previous calendar day as baseline; order by day.

Edit `script.sql`, Run to inspect the final table, then Submit. The result checks cover column names, row count, and complete rows. They do not prove a particular view definition or transaction was used.

The briefing is complete. Describe the partial first windows and the undefined zero-baseline percentage when sharing it. Do not interpret a missing percentage as no change.
