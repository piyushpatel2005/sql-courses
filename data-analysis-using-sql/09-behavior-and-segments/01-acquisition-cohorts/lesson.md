---
title: Build a cohort from the first eligible purchase
slug: acquisition-cohorts
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Assign members to the month of their first eligible purchase.
seo_title: Build a cohort from the first eligible purchase | Data Analysis Using SQL
seo_description: Assign members to the month of their first eligible purchase.
seo_keywords:
- SQL analysis
- acquisition cohorts
- PostgreSQL
sql:
  seed: seed.sql
---

# Build a cohort from the first eligible purchase

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `volunteer_shifts`

One row represents one volunteer shift.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `person` · `text` | Volunteer name label used for grouping; not an enforced unique identity. | Nullable; `NULL` means no person value is recorded. |
| `at` · `timestamp with time zone` | Shift occurrence instant; acquisition month uses its UTC calendar. | Nullable; `NULL` means occurrence time is unrecorded. |
| `state` · `text` | Shift status; done is eligible while cancelled is not; sample labels are not constrained. | Nullable; `NULL` means no state value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

### Named intermediate results

These dictionaries describe the columns exposed by the named query steps. They are not extra preloaded tables or a complete answer query.

#### `first_shift`

One row represents one volunteer-name group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `person` · `text` | Identity used to group eligible completed shifts. | May be `NULL` under its source or expression policy. Logical unique group key, not a physical primary key. |
| `first_at` · `timestamp with time zone` | Earliest eligible occurrence instant; interpreted in UTC for acquisition-month bucketing. | May be `NULL` under its source or expression policy. MIN ignores missing timestamps; the registered-purchase source requires occurrence time. |

This CTE is statement-local; it has no independently declared primary key, foreign key or NOT NULL constraint.

This uses eligible prior history, not a new first purchase in each reporting month. Members without eligible purchases have no first_paid row.

The trend briefing followed dates. A cohort report follows a fixed group of people through later dates, so its first task is to decide who enters that group.

A cohort fixes membership at a starting event. Define that event before comparing later behavior across groups.

An acquisition cohort here means the UTC month of a registered member's first paid order before April 1, 2025. It is not their signup month. First filter to eligible purchases, then find each member's `MIN` purchase time, then bucket it into a month. Members without paid purchases have no acquisition cohort.

Do not compute a separate first purchase within each reporting month: that would let the same member re-enter new cohorts. This fixture contains the full prior purchase history for the defined analysis. In a truncated extract, the first observed purchase might not be the true first purchase; report that limitation.

## Read and run

A ceramics studio groups volunteers by their first completed shift month.

```sql run
WITH first_shift AS (
  SELECT person, MIN(at) AS first_at
  FROM volunteer_shifts WHERE state = 'done'
  GROUP BY person
)
SELECT person,
       DATE_TRUNC(
         'month', first_at AT TIME ZONE 'UTC'
       )::date::text AS cohort
FROM first_shift ORDER BY person;
```

Ira belongs to January even after returning in February. Tao has no completed-shift cohort, rather than a January cohort with zero activity.

Ira can return in several months but belongs to one acquisition cohort. Reassigning the cohort on each visit would erase that starting point.
