---
title: Profile missing values without hiding them
slug: profile-missing-values
order: 3
language: sql
runtime: sql
lesson_type: interactive
summary: Measure how many source amounts are known before calculating a metric.
seo_title: Profile missing values without hiding them | Data Analysis Using SQL
seo_description: Measure how many source amounts are known before calculating a metric.
seo_keywords:
- SQL analysis
- profile missing values
- PostgreSQL
sql:
  seed: seed.sql
---

# Profile missing values without hiding them

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `timings`

One row represents one repair job with an optional timing.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `job_id` · `integer` | Repair job identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `minutes` · `integer` | Recorded job duration in minutes; zero is a known duration, not missing. | Nullable; `NULL` means the minutes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

A report can look complete while silently excluding unknown amounts. Count the rows and the known values before using an average.

`COUNT(*)` counts rows; `COUNT(column)` counts non-null values. `NULL` means missing or unknown, not zero and not an empty string. Test it with `IS NULL`, never `= NULL`. Subtracting the two counts gives the number of missing values. Aggregates without `GROUP BY` produce one summary row; the next pair of lessons develops grouped summaries.

An empty string is still a present text value. Replacing a missing payment with zero would change a financial metric, so first report the missingness separately.

## Read and run

The desk recorded a duration only when a repair was timed.

```sql run
SELECT COUNT(*) AS jobs, COUNT(minutes) AS timed_jobs,
       COUNT(*) - COUNT(minutes) AS missing_jobs
FROM timings;
```

Zero minutes is counted as known. Only the null duration creates a gap between the first two counts. A count can therefore be correct while describing a narrower population than the reader expects.

If job 32 acquired a known duration, timed_jobs would rise and missing_jobs would fall. The number of jobs would stay the same.
