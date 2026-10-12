---
title: Select an inclusive range with BETWEEN
slug: between-ranges
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Select a numeric range that includes both endpoints.
seo_title: Select an inclusive range with BETWEEN | Introduction to SQL
seo_description: Select a numeric range that includes both endpoints.
seo_keywords:
- SQL
- PostgreSQL
- Select an inclusive range with BETWEEN
sql:
  seed: seed.sql
---

# Select an inclusive range with BETWEEN

BETWEEN selects values from a lower bound through an upper bound, including both endpoints. The AND inside `price BETWEEN 3 AND 5` is part of the range syntax. It is equivalent here to price >= 3 AND price <= 5.

Run the cafe query and look for values exactly at a boundary. A timestamp range has a separate complication: an inclusive midnight endpoint does not include the rest of that date. Later date lessons use an exclusive next-period boundary for whole days and months. This lesson uses plain numeric prices.

```sql run
SELECT item,
       price
FROM menu
WHERE price BETWEEN 3 AND 5
ORDER BY item_id;
```
