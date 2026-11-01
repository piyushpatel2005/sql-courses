---
title: Advance a calendar boundary with INTERVAL
slug: calendar-intervals
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Find the next calendar-month boundary without assuming thirty days.
seo_title: Advance a calendar boundary with INTERVAL | Data Analysis Using SQL
seo_description: Find the next calendar-month boundary without assuming thirty days.
seo_keywords:
- SQL
- PostgreSQL
- Advance a calendar boundary with INTERVAL
sql:
  seed: seed.sql
---

# Advance a calendar boundary with INTERVAL

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `starts`

One row represents one illustrative reporting-month start.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label` · `text` | Readable period label, not a date or a constrained identifier. | Nullable; `NULL` means no label value is recorded. |
| `day` · `date` | First-of-month calendar date in the sample; no time of day or time zone. | Nullable; `NULL` means the calendar date is unrecorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

An INTERVAL describes a duration or calendar step. Adding INTERVAL '1 month' to a first-of-month date gives the next month boundary; it is not a fixed thirty-day addition. Cast the result back to date when a report uses calendar keys.

The examples cross a year boundary and a short month. Run them and compare the resulting dates. First-of-month inputs avoid the separate problem of deciding what a month after January 31 should mean.

```sql run
SELECT label,
       (day + INTERVAL '1 month')::date::text AS next_month
FROM starts
ORDER BY label;
```
