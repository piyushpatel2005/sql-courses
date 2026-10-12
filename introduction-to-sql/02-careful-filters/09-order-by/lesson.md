---
title: Sort rows with an explicit tie-breaker
slug: order-by
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Sort rows predictably when values tie.
seo_title: Sort rows with an explicit tie-breaker | Introduction to SQL
seo_description: Sort rows predictably when values tie.
seo_keywords:
- SQL
- PostgreSQL
- Sort rows with an explicit tie-breaker
sql:
  seed: seed.sql
---

# Sort rows with an explicit tie-breaker

ORDER BY determines the display order. ASC is ascending and is the default; DESC reverses it. A second expression resolves ties in the first.

The cafe sorts expensive items first and uses item_id for any tied price. Without a final unique tie-breaker, equally priced items can appear in either order. PostgreSQL also supports NULLS FIRST and NULLS LAST to choose where missing sort values appear. Run the list and check both its first price and its final price.

```sql run
SELECT item,
       price
FROM menu
ORDER BY price DESC,
       item_id;
```
