---
title: Find a maximum with MAX
slug: maximum-value
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Find the largest known fee in the catalog.
seo_title: Find a maximum with MAX | Introduction to SQL
seo_description: Find the largest known fee in the catalog.
seo_keywords:
- SQL
- PostgreSQL
- Find a maximum with MAX
sql:
  seed: seed.sql
---

# Find a maximum with MAX

MAX returns the largest known value, not the identity of the row containing it. An ungrouped maximum has one output row even when several inputs tie. NULLs are ignored and an empty collection returns NULL.

The result shows an amount, not the stall that earned it. Tied maxima would still produce one summary value.

```sql run
SELECT MAX(amount) AS largest_sale
FROM sales;
```
