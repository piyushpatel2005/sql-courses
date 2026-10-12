---
title: Require both conditions with AND
slug: and-conditions
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Require availability and a price condition together.
seo_title: Require both conditions with AND | Introduction to SQL
seo_description: Require availability and a price condition together.
seo_keywords:
- SQL
- PostgreSQL
- Require both conditions with AND
sql:
  seed: seed.sql
---

# Require both conditions with AND

An affordable item is not useful to a customer if it is sold out. AND requires both conditions to be true. PostgreSQL boolean columns hold true or false (and NULL if allowed); these keywords are not quoted text.

Here the price rule and stock rule both apply to every row. Run the query, then inspect an unavailable item and an expensive item to see why each is excluded. The exercise uses the same intersection of requirements on lending data.

```sql run
SELECT item,
       price
FROM menu
WHERE in_stock = true AND price < 4
ORDER BY item_id;
```
