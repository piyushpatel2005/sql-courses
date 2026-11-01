---
title: Interpolate a percentile with PERCENTILE_CONT
slug: continuous-percentiles
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Compute a continuous median that may fall between observed amounts.
seo_title: Interpolate a percentile with PERCENTILE_CONT | Data Analysis Using SQL
seo_description: Compute a continuous median that may fall between observed amounts.
seo_keywords:
- SQL
- PostgreSQL
- Interpolate a percentile with PERCENTILE_CONT
sql:
  seed: seed.sql
---

# Interpolate a percentile with PERCENTILE_CONT

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `durations`

One row represents one repair-duration observation.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `minutes` · `numeric` | Observed duration in minutes; a NULL observation is not a zero-minute repair. | Nullable; `NULL` means the minutes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

PERCENTILE_CONT(fraction) WITHIN GROUP (ORDER BY value) is an ordered-set aggregate. A fraction of 0.5 is the continuous median and 0.9 is the 90th percentile. The answer may lie between observed values. NULL inputs are ignored, so report the known-value count.

The separate `durations` fixture has one repair duration observation per row. `minutes` is nullable numeric time in minutes; the missing observation does not count as a measured repair. The four known values sort to 10, 10, 20, and 100. The continuous median lies halfway between the middle two, so it is 15 minutes rather than an observed duration.

Compare that median with the input list, not with a claim about future service times. Percentiles on a small sample are descriptive, not confidence intervals. The numeric cast permits the already taught two-decimal rounding.

```sql run
SELECT COUNT(minutes) AS measured,
       ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (
         ORDER BY minutes
       ))::numeric, 2) AS median_minutes
FROM durations;
```
