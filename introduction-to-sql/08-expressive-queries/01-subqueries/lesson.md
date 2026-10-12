---
title: Use a scalar subquery as a value
slug: subqueries
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Compare each fee with a mean computed by a scalar subquery.
seo_title: Use a scalar subquery as a value | Introduction to SQL
seo_description: Compare each fee with a mean computed by a scalar subquery.
seo_keywords:
- SQL
- PostgreSQL
- Use a scalar subquery as a value
sql:
  seed: seed.sql
---

# Use a scalar subquery as a value

A scalar subquery returns one column and at most one row for a position expecting one value. The parenthesized AVG query supplies a computed benchmark for each outer comparison. Several rows would be an error; no rows would supply NULL.

The cafe compares each item with its own overall mean. Read the inner question first while learning, but do not assume that the planner must physically execute it in that order. Filtering the inner population differently would change the benchmark.

```sql run
SELECT item,price
FROM menu
WHERE price > (SELECT AVG(price)
FROM menu)
ORDER BY item_id;
```
