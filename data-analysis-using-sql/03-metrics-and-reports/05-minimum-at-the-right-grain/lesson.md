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
