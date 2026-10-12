---
title: Filter rows with WHERE
slug: where-filters
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Keep only rows that satisfy a comparison.
seo_title: Filter rows with WHERE | Introduction to SQL
seo_description: Keep only rows that satisfy a comparison.
seo_keywords:
- SQL
- PostgreSQL
- Filter rows with WHERE
sql:
  seed: seed.sql
---

# Filter rows with WHERE

The cafe wants a short list of inexpensive items. WHERE tests a condition on each source row and keeps only true results. Put it after FROM and before ORDER BY.

Comparisons include =, <> (not equal), <, <=, >, and >=. Text constants use single quotes, while numbers do not. The example includes only prices strictly below 4; changing < to <= would include an item priced exactly 4. A SELECT alias is not available in WHERE, so use the source column or repeat its calculation.

```sql run
SELECT item,
       price
FROM menu
WHERE price < 4
ORDER BY item_id;
```
