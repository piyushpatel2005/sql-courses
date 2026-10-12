---
title: Add known values with SUM
slug: sum-values
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Add known fees into one catalog total.
seo_title: Add known values with SUM | Introduction to SQL
seo_description: Add known fees into one catalog total.
seo_keywords:
- SQL
- PostgreSQL
- Add known values with SUM
sql:
  seed: seed.sql
---

# Add known values with SUM

SUM adds the non-NULL values in a column. It does not add a missing value as zero. With no known inputs, SUM returns NULL. Keep units in mind: adding per-item fees describes the cost of borrowing one of each item, not the number of items.

The sales result has one total, not one row per stall. Every known amount contributes once.

```sql run
SELECT SUM(amount) AS total
FROM sales;
```
