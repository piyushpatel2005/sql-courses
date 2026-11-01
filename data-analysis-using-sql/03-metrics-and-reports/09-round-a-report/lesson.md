---
title: Round a numeric report value
slug: round-a-report
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Round an aggregate result rather than every input amount.
seo_title: Round a numeric report value | Data Analysis Using SQL
seo_description: Round an aggregate result rather than every input amount.
seo_keywords:
- SQL
- PostgreSQL
- Round a numeric report value
sql:
  seed: seed.sql
---

# Round a numeric report value

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

ROUND(value, 2) rounds a numeric value to two decimal places. Rounding is a display choice, not a claim that the inputs have that precision. Compute the aggregate first and round its result rather than rounding every input prematurely.

The garden query uses AVG, which you have already practiced. Its new operation is the rounding step. Keep the unrounded value available while investigating differences between reports.

```sql run
SELECT crew,
       ROUND(AVG(hours),
       2) AS mean_hours
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
