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

SUM adds known values within each group. WHERE defines which source rows enter those groups. Missing amounts are not known zeros. A grouped sum has one row per group rather than one row per original order.

The void job must not affect Fern's total. Check the input status before comparing the crew summaries.

```sql run
SELECT crew,
       SUM(hours) AS measure
FROM jobs
WHERE state = 'done'
GROUP BY crew
ORDER BY crew;
```
