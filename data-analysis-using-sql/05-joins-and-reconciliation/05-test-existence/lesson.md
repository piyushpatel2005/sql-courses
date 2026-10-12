---
title: Use existence when you do not need child rows
slug: test-existence
order: 5
language: sql
runtime: sql
lesson_type: interactive
summary: Find registered members with no paid activity.
seo_title: Use existence when you do not need child rows | Data Analysis Using SQL
seo_description: Find registered members with no paid activity.
seo_keywords:
- SQL analysis
- test existence
- PostgreSQL
sql:
  seed: seed.sql
---

# Use existence when you do not need child rows

A question about whether activity exists does not need one output row per activity. Use a semi-join pattern to keep the member grain.

`EXISTS (SELECT 1 FROM ... WHERE ...)` is true if the subquery finds any row. The selected constant is irrelevant; existence is the question. A correlated subquery refers to the current outer row, so each member can receive their own test.

`NOT EXISTS` is especially useful for missing-activity reports. Unlike `NOT IN`, it does not become unknown because a subquery happens to contain a null key. Counting joined rows and adding DISTINCT afterward is unnecessary when existence is all you need.

## Read and run

A library wants readers who have never returned an item late.

```sql run
SELECT r.reader
FROM readers r
WHERE NOT EXISTS (
  SELECT 1 FROM returns x
  WHERE x.reader = r.reader AND x.late
)
ORDER BY r.reader;
```

Readers 2 and 3 remain exactly once. The null reader in the returns table does not invalidate the missing-activity check.

A late return by reader 3 would remove that reader from the result. It would not affect reader 2 because the subquery is correlated.
