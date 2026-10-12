---
title: Calculate a mean with AVG
slug: average-values
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate the mean of the catalog's known fees.
seo_title: Calculate a mean with AVG | Introduction to SQL
seo_description: Calculate the mean of the catalog's known fees.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a mean with AVG
sql:
  seed: seed.sql
---

# Calculate a mean with AVG

AVG divides the sum of known values by their count. NULL inputs do not contribute to either side. A known zero does. A mean describes this chosen population; filtering the input first changes the question. PostgreSQL numeric inputs retain fractional results.

The sales result uses known amounts as its denominator. A missing amount would not act like a recorded zero.

```sql run
SELECT AVG(amount) AS average_sale
FROM sales;
```
