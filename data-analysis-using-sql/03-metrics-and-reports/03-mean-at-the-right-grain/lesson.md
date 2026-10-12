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
