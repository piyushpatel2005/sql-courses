---
title: Find the smallest known observation
slug: minimum-at-the-right-grain
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Find each member's smallest known paid amount.
seo_title: Find the smallest known observation | Data Analysis Using SQL
seo_description: Find each member's smallest known paid amount.
seo_keywords:
- SQL
- PostgreSQL
- Find the smallest known observation
sql:
  seed: seed.sql
---

# Find the smallest known observation

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

MIN returns the smallest known value within each group, not the whole record containing that value. Multiple tied rows still produce one minimum. The group key tells a reader which population the minimum describes.

A crew with several jobs still has one minimum. The query does not identify which job produced it.

```sql run
SELECT crew,
       MIN(hours) AS measure
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
