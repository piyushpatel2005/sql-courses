---
title: Interpret an instant in a reporting zone
slug: reporting-time-zones
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Display an instant as a date in a named reporting zone.
seo_title: Interpret an instant in a reporting zone | Data Analysis Using SQL
seo_description: Display an instant as a date in a named reporting zone.
seo_keywords:
- SQL
- PostgreSQL
- Interpret an instant in a reporting zone
sql:
  seed: seed.sql
---

# Interpret an instant in a reporting zone

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `returns_clock`

One row represents one return record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `return_id` · `integer` | Return-record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `at` · `timestamp with time zone` | Return occurrence instant; UTC and New York date displays refer to this same instant. | Nullable; `NULL` means occurrence time is unrecorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The full-snapshot ledgers did not need a calendar boundary. A daily or monthly report does: the same order can fall on different local dates without changing its instant.

In this separate `returns_clock` demo, each row is one return record. `return_id` is an integer identifier, and `at` is a `timestamptz` (timestamp with time zone). The exercise uses the same timestamp type for `orders.placed_at`.

A `timestamptz` stores an instant, not the original zone label. Applied to that type, `AT TIME ZONE` returns a timestamp without time zone showing wall-clock time in the named zone. Cast that result to `date` to choose a local calendar day, then `text` for an ISO date display. The parentheses keep the zone conversion before both casts.

The first two returns straddle UTC midnight but belong to the previous evening in New York. The third occurs after New York midnight. Named zones handle daylight-saving rules; a permanent fixed offset may not. Run both date columns and identify where they disagree. This lesson does not yet restrict the time population.

```sql run
SELECT return_id,
       (at AT TIME ZONE 'UTC')::date::text AS utc_day,
       (at AT TIME ZONE 'America/New_York')::date::text
         AS local_day
FROM returns_clock
ORDER BY return_id;
```
