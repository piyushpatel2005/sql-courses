---
title: Calculate a result with arithmetic
slug: arithmetic-expressions
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate a quote from a stored daily price.
seo_title: Calculate a result with arithmetic | Introduction to SQL
seo_description: Calculate a quote from a stored daily price.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a result with arithmetic
sql:
  seed: seed.sql
---

# Calculate a result with arithmetic

A price for two items can be calculated without changing either item's stored price. An expression such as `price * 2` is evaluated for each row. Use the alias syntax from the previous lesson to name the answer.

SQL supports +, -, *, and /. Parentheses control grouping: `(price + 1) * 2` includes the extra amount twice. Integer division discards a fractional part in PostgreSQL; a decimal operand such as `5.0 / 2` keeps it. Run the quote and check Tea against its original price.

```sql run
SELECT item,
       price * 2 AS pair_price
FROM menu
ORDER BY item_id;
```
