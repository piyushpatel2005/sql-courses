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

PERCENTILE_CONT(fraction) WITHIN GROUP (ORDER BY value) is an ordered-set aggregate. A fraction of 0.5 is the continuous median and 0.9 is the 90th percentile. The answer may lie between observed values. NULL inputs are ignored, so report the known-value count.

The clinic has a long repair alongside shorter jobs. Compare the median with the input list, not with a claim about future service times. Percentiles on a small sample are descriptive, not confidence intervals. The numeric cast permits the already taught two-decimal rounding.

```sql run
SELECT COUNT(minutes) AS measured,
       ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY minutes))::numeric,2) AS median_minutes
FROM durations;
```
