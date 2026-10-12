---
title: Choose a value with CASE
slug: case-expressions
order: 17
language: sql
lesson_type: interactive
runtime: sql
summary: Turn an availability condition into a readable status.
seo_title: Choose a value with CASE | Introduction to SQL
seo_description: Turn an availability condition into a readable status.
seo_keywords:
- SQL
- PostgreSQL
- Choose a value with CASE
sql:
  seed: seed.sql
---

# Choose a value with CASE

CASE checks WHEN conditions in order and returns the THEN value for the first true condition. ELSE supplies a fallback; without it an unmatched row gets NULL. END closes the expression.

The cafe converts a stored availability flag into a readable label without changing that flag. Put narrower rules before broader ones so an early condition does not swallow later cases. The result branches must have compatible types. Run the labels and compare them with the source booleans.

```sql run
SELECT item,
       CASE WHEN in_stock THEN 'ready' ELSE 'sold out' END AS status
FROM menu
ORDER BY item_id;
```
