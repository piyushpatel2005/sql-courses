---
title: Group records by a business key
slug: group-records
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Count imported records for each business key.
seo_title: Group records by a business key | Data Analysis Using SQL
seo_description: Count imported records for each business key.
seo_keywords:
- SQL
- PostgreSQL
- Group records by a business key
sql:
  seed: seed.sql
---

# Group records by a business key

GROUP BY collects rows with the same key into a group. A selected group key names each output row, and COUNT(*) describes the rows inside it. ORDER BY still controls display; grouping alone promises no order.

The import ID identifies a received record, while reader_ref identifies a supposed person. Grouping by load IDs would miss repeated person references. Run the counts and keep every group, including groups of size one. The next lesson chooses which groups need review.

```sql run
SELECT reader_ref,COUNT(*) AS copies
FROM imports
GROUP BY reader_ref
ORDER BY reader_ref;
```
