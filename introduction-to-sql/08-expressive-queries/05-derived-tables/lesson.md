---
title: Read a subquery as a table
slug: derived-tables
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Query a grouped result as an intermediate table.
seo_title: Read a subquery as a table | Introduction to SQL
seo_description: Query a grouped result as an intermediate table.
seo_keywords:
- SQL
- PostgreSQL
- Read a subquery as a table
sql:
  seed: seed.sql
---

# Read a subquery as a table

A parenthesized query in FROM supplies an intermediate table for one statement. Give it an alias and refer to its selected columns from the outer query. This is often called a derived table.

The cafe first summarizes each section, then filters the summary as ordinary rows. The intermediate grain is one row per section. Keep the inner and outer parentheses clear; the alias names the result, not a persistent database object.

```sql run
SELECT section,total
FROM (SELECT section,SUM(price) AS total
FROM menu
GROUP BY section) AS totals
WHERE total >= 5
ORDER BY section;
```
