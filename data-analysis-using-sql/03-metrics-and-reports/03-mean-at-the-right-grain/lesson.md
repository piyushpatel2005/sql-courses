---
title: Calculate the mean of known observations
slug: mean-at-the-right-grain
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate a mean over each member's known paid amounts.
seo_title: Calculate the mean of known observations | Data Analysis Using SQL
seo_description: Calculate a mean over each member's known paid amounts.
seo_keywords:
- SQL
- PostgreSQL
- Calculate the mean of known observations
sql:
  seed: seed.sql
---

# Calculate the mean of known observations

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `jobs`

One row represents one job.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `job_id` · `integer` | Job record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `crew` · `text` | Crew label used to group work. | Nullable; `NULL` means no crew value is recorded. |
| `hours` · `numeric` | Work duration in hours, not minutes or a count of jobs. | Nullable; `NULL` means the hours measure is unrecorded, not zero. |
| `state` · `text` | Job status; done and void occur in the sample, without an enforced vocabulary. | Nullable; `NULL` means no state value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

AVG divides the sum of known values by the number of known values. Its denominator can be smaller than the source row count. Keep the population explicit: the average paid amount should not include cancelled records.

Fern's completed jobs contribute to the mean; the long void job does not. Changing that filter changes the population.

```sql run
SELECT crew,
       AVG(hours) AS measure
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
