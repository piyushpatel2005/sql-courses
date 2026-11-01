---
title: Sum a measure at the chosen grain
slug: aggregate-at-the-right-grain
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Sum paid amounts separately for each member key.
seo_title: Sum a measure at the chosen grain | Data Analysis Using SQL
seo_description: Sum paid amounts separately for each member key.
seo_keywords:
- SQL
- PostgreSQL
- Sum a measure at the chosen grain
sql:
  seed: seed.sql
---

# Sum a measure at the chosen grain

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

SUM adds known values within each group. WHERE defines which source rows enter those groups. Missing amounts are not known zeros. A grouped sum has one row per group rather than one row per original order.

The cleaned fees are now numbers, but choosing `SUM` still requires a question and a population. This separate `jobs` demo has one job per row: `job_id` is an integer identifier, `crew` and `state` are text labels, and `hours` is numeric time in hours. We want completed-work hours per crew, so a void job must not affect Fern's total.

In the query, the comma separates the selected group key from the aggregate expression. `AS measure` names that expression in the result. `WHERE` chooses completed jobs before `GROUP BY crew` changes the output grain to one row per crew.

```sql run
SELECT crew,
       SUM(hours) AS measure
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
