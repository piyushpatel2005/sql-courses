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
