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

PERCENTILE_DISC uses the first observed value whose cumulative proportion reaches the requested fraction. It does not interpolate. At 0.5 it returns an observed median, which can differ from the continuous median for an even-sized collection.

The clinic has a long repair alongside shorter jobs. Compare the median with the input list, not with a claim about future service times. Percentiles on a small sample are descriptive, not confidence intervals. The numeric cast permits the already taught two-decimal rounding.

```sql run
SELECT COUNT(minutes) AS measured,
       ROUND((PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY minutes))::numeric,2) AS median_minutes
FROM durations;
```
