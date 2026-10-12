---
title: Rank a review queue without erasing ties
slug: rank-a-review-queue
order: 16
language: sql
runtime: sql
lesson_type: interactive
summary: Keep every order at the two highest distinct amount levels.
seo_title: Rank a review queue without erasing ties | Data Analysis Using SQL
seo_description: Keep every order at the two highest distinct amount levels.
seo_keywords:
- SQL analysis
- rank a review queue
- PostgreSQL
sql:
  seed: seed.sql
---

# Rank a review queue without erasing ties

A review queue may include every row at its two highest value levels. This is a rank-filtering task, not a request for exactly two rows.

You already practiced the three rank functions separately. DENSE_RANK fits this queue because tied values should share a level without gaps. Compute that rank in a CTE before filtering it.

A top-two-ranks filter may return more than two rows when there are ties. If exactly two rows are required, use row numbers with an explicit tie policy and acknowledge that a tied row was excluded.

## Read and run

A garden ranks harvest baskets by weight and then keeps the two highest distinct weight levels.

```sql run
WITH ranked AS (
 SELECT basket, kg, DENSE_RANK() OVER (ORDER BY kg DESC) AS level
 FROM baskets
)
SELECT basket, kg, level FROM ranked
WHERE level <= 2 ORDER BY kg DESC, basket;
```

Three baskets remain because two baskets tie at the highest weight. A row-number filter of at most two would answer a different question.

Exactly two rows would be a different queue policy. The tied baskets explain why this report keeps more rows than value levels.
