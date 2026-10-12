---
title: State the monetary measure in a member report
slug: purchase-monetary-value
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Report gross paid value for each registered member at the cutoff.
seo_title: State the monetary measure in a member report | Data Analysis Using SQL
seo_description: Report gross paid value for each registered member at the cutoff.
seo_keywords:
- SQL
- PostgreSQL
- State the monetary measure in a member report
sql:
  seed: seed.sql
---

# State the monetary measure in a member report

Monetary value needs a defined measure and window. Here it is gross paid amount in USD, before refunds. Net revenue would be a different segmentation policy. Include only eligible purchases and keep never-buyers in the member population.

A member with no eligible orders has zero known gross in this complete toy snapshot. Do not generalize that fill rule to orders whose amounts are missing. The fixture has known amounts for paid orders.

```sql run
SELECT r.reader,COALESCE(SUM(p.amount),0) AS gross
FROM readers r
LEFT JOIN purchases p ON p.reader=r.reader
GROUP BY r.reader
ORDER BY r.reader;
```
