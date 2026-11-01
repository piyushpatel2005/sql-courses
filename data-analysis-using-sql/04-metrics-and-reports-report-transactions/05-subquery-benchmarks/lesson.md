---
title: Compare a row with a computed benchmark
slug: subquery-benchmarks
order: 5
language: sql
runtime: sql
lesson_type: interactive
summary: Compare paid orders with a mean computed from the same population.
seo_title: Compare a row with a computed benchmark | Data Analysis Using SQL
seo_description: Compare paid orders with a mean computed from the same population.
seo_keywords:
- SQL analysis
- subquery benchmarks
- PostgreSQL
sql:
  seed: seed.sql
---

# Compare a row with a computed benchmark

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `sessions`

One row represents one studio session.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `session_id` · `integer` | Session record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `state` · `text` | Session status; done and cancelled are observed labels, not an enforced list. | Nullable; `NULL` means no state value is recorded. |
| `minutes` · `numeric` | Session duration in minutes; the query chooses which statuses enter its benchmark. | Nullable; `NULL` means the minutes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

A fixed cutoff can become stale. A scalar subquery lets a report compare each record with a benchmark computed from the same defined population.

A subquery is a query inside another query. In a comparison, a scalar subquery must return one column and at most one row. An ungrouped `AVG` supplies that one-row benchmark. Give the outer and inner queries the same population filter when you intend a like-for-like comparison.

The benchmark is not a causal explanation or a target. Above average simply describes position relative to this sample. A large outlier can raise the mean enough that most records fall below it; a later lesson compares means with medians.

## Read and run

A studio compares completed session lengths with their mean.

```sql run
SELECT session_id, minutes
FROM sessions
WHERE state = 'done'
  AND minutes > (SELECT AVG(minutes)
                 FROM sessions WHERE state = 'done')
ORDER BY session_id;
```

The cancelled session is excluded on both sides. Only the 70-minute session is above the completed-session mean.

Including the cancelled session in the inner mean would change the benchmark while leaving the outer population alone. That would no longer be a comparison among completed sessions.
