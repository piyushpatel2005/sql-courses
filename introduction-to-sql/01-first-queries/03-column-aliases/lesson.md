---
title: Name a result column with AS
slug: column-aliases
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Give a result column a useful heading with AS.
seo_title: Name a result column with AS | Introduction to SQL
seo_description: Give a result column a useful heading with AS.
seo_keywords:
- SQL
- PostgreSQL
- Name a result column with AS
sql:
  seed: seed.sql
---

# Name a result column with AS

The cafe prints prices under a heading its customers recognize. `AS` gives a selected expression an output name; it does not rename the stored column. Write the source column first, then AS and the new heading. Other clauses can still refer to the source column.

Run the query and compare the heading with the table definition. The values have not changed. In the exercise, choose a different heading for a lending fee.

```sql run
SELECT item,
       price AS menu_price
FROM menu
ORDER BY item_id;
```
