---
title: Reverse a known condition with NOT
slug: not-conditions
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Find the rows that fail a known boolean condition.
seo_title: Reverse a known condition with NOT | Introduction to SQL
seo_description: Find the rows that fail a known boolean condition.
seo_keywords:
- SQL
- PostgreSQL
- Reverse a known condition with NOT
sql:
  seed: seed.sql
---

# Reverse a known condition with NOT

NOT reverses true and false. It is useful when the requested population is the opposite of a familiar condition. The cafe is checking items that are not currently in stock.

Parentheses make the condition being reversed clear. NOT applies before AND and OR, so explicit grouping helps when a condition grows. A missing value does not become known simply because you negate a comparison; the next section explains that NULL behavior. The supplied availability columns here are required booleans.

```sql run
SELECT item
FROM menu
WHERE NOT (in_stock = true)
ORDER BY item_id;
```
