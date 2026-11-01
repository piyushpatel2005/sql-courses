---
title: Find the largest known observation
slug: maximum-at-the-right-grain
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Find each member's largest known paid amount.
seo_title: Find the largest known observation | Data Analysis Using SQL
seo_description: Find each member's largest known paid amount.
seo_keywords:
- SQL
- PostgreSQL
- Find the largest known observation
sql:
  seed: seed.sql
---

# Find the largest known observation

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

MAX returns the largest known value within each group. It is useful for an extreme, but it does not describe a typical observation and does not identify the record by itself. A missing value cannot become the maximum.

The long void job is excluded before MAX runs. An impressive number can still be the wrong answer if it describes the wrong population.

```sql run
SELECT crew,
       MAX(hours) AS measure
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
