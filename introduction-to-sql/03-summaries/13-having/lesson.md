---
title: Filter groups with HAVING
slug: having
order: 13
language: sql
runtime: sql
lesson_type: interactive
summary: Keep groups that satisfy an aggregate condition.
seo_title: Filter groups with HAVING | Introduction to SQL
seo_description: Keep groups that satisfy an aggregate condition.
seo_keywords:
- SQL
- PostgreSQL
- having
sql:
  seed: seed.sql
---

# Filter groups with HAVING

A market organizer wants only stalls whose combined sales reach 15. That condition belongs in `HAVING`, because the total does not exist until after grouping. WHERE tests individual source rows; HAVING tests groups.

In the demo, all five sales enter their groups. HAVING removes North's group because its sum is 7. East and West remain. Moving `amount >= 15` into WHERE would answer a different question: it would discard smaller individual sales before computing totals.

The useful mental order is FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT. This is a reasoning model, not a promise about physical execution. The database can choose a different execution plan while preserving the query's meaning.

PostgreSQL does not let a SELECT alias stand in for an aggregate in HAVING. Write `HAVING SUM(amount) >= 15`, even though the result calls it `total`.


![Row filtering precedes grouping; group filtering precedes the final ordered report.](query-stages.svg)

```sql run
SELECT stall, SUM(amount) AS total
FROM sales
GROUP BY stall
HAVING SUM(amount) >= 15
ORDER BY stall;
```
