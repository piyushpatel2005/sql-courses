---
title: Choose an observed percentile with PERCENTILE_DISC
slug: discrete-percentiles
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Choose a median from the observed paid amounts.
seo_title: Choose an observed percentile with PERCENTILE_DISC | Data Analysis Using SQL
seo_description: Choose a median from the observed paid amounts.
seo_keywords:
- SQL
- PostgreSQL
- Choose an observed percentile with PERCENTILE_DISC
sql:
  seed: seed.sql
---

# Choose an observed percentile with PERCENTILE_DISC

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `durations`

One row represents one repair-duration observation.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `minutes` · `numeric` | Observed duration in minutes; a NULL observation is not a zero-minute repair. | Nullable; `NULL` means the minutes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

PERCENTILE_DISC uses the first observed value whose cumulative proportion reaches the requested fraction. It does not interpolate. At 0.5 it returns an observed median, which can differ from the continuous median for an even-sized collection.

The continuous median was 15, between the two middle observations. With the same four known durations (10, 10, 20, 100), the cumulative proportion reaches one half at the second value, 10. The discrete median is therefore 10, a recorded value rather than an interpolation.

This is a choice of report definition, not a claim about future service times. Percentiles on a small sample are descriptive, not confidence intervals. The numeric cast permits the already taught two-decimal rounding.

```sql run
SELECT COUNT(minutes) AS measured,
       ROUND((PERCENTILE_DISC(0.5) WITHIN GROUP (
         ORDER BY minutes
       ))::numeric, 2) AS median_minutes
FROM durations;
```
