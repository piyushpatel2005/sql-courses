---
title: Use a subquery as an IN list
slug: subquery-lists
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Select categories through a one-column subquery.
seo_title: Use a subquery as an IN list | Introduction to SQL
seo_description: Select categories through a one-column subquery.
seo_keywords:
- SQL
- PostgreSQL
- Use a subquery as an IN list
sql:
  seed: seed.sql
---

# Use a subquery as an IN list

IN can read the values returned by a one-column subquery instead of a literal list. It asks whether the outer value occurs anywhere in that result. Repeated inner values do not create extra outer rows.

Here the subquery selects the cafe sections containing a cheap item, and the outer query lists every item in those sections. The question differs from directly filtering the outer price. Keep NULL behavior in mind before turning IN into NOT IN.

```sql run
SELECT item,section
FROM menu
WHERE section IN (SELECT section
FROM menu
WHERE price < 3)
ORDER BY item_id;
```
