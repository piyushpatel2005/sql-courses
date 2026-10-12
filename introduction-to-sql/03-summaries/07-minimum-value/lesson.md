---
title: Find a minimum with MIN
slug: minimum-value
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Find the smallest known fee without selecting an arbitrary item.
seo_title: Find a minimum with MIN | Introduction to SQL
seo_description: Find the smallest known fee without selecting an arbitrary item.
seo_keywords:
- SQL
- PostgreSQL
- Find a minimum with MIN
sql:
  seed: seed.sql
---

# Find a minimum with MIN

MIN returns the smallest known value. It does not return the whole row that contains that value, and tied minima still produce one summary value. NULLs are ignored; an empty collection has no known minimum.

The result shows the smallest amount without a sale identifier. An identifier would require a separate row-selection question.

```sql run
SELECT MIN(amount) AS smallest_sale
FROM sales;
```
