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
