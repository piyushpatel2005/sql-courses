---
title: Take a bounded result with LIMIT
slug: limit-rows
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Choose a fixed number of rows from a deliberate ordering.
seo_title: Take a bounded result with LIMIT | Introduction to SQL
seo_description: Choose a fixed number of rows from a deliberate ordering.
seo_keywords:
- SQL
- PostgreSQL
- Take a bounded result with LIMIT
sql:
  seed: seed.sql
---

# Take a bounded result with LIMIT

LIMIT takes a maximum number of rows from the query result. Use the ordering rule from the previous lesson to decide which rows are kept. Without ORDER BY, a limit means an arbitrary subset, not the first records inserted.

The cafe displays only its two highest prices. Sorting happens before the limit in the query's logical meaning. In the exercise, a tied fee sits at the cutoff, so the identifier tie-breaker decides which item remains.

```sql run
SELECT item,
       price
FROM menu
ORDER BY price DESC,
       item_id LIMIT 2;
```
