---
title: Match an allowed list with IN
slug: in-lists
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Match a column against an explicit list of allowed values.
seo_title: Match an allowed list with IN | Introduction to SQL
seo_description: Match a column against an explicit list of allowed values.
seo_keywords:
- SQL
- PostgreSQL
- Match an allowed list with IN
sql:
  seed: seed.sql
---

# Match an allowed list with IN

IN compares one value with a list of allowed values. It is a compact way to express several equality alternatives: `section IN ('food', 'drink')` accepts either section. The list is enclosed in parentheses and its values are comma-separated.

The cafe example chooses named items rather than a price range. Adding the same name twice to the list would not duplicate a result row. Keep this list to known values: a NULL inside NOT IN can make an absence test unknown. We will use NOT EXISTS for missing related rows later.

```sql run
SELECT item,
       price
FROM menu
WHERE item IN ('Tea',
       'Soup')
ORDER BY item_id;
```
