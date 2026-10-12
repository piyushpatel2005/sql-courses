---
title: Count distinct known identities
slug: count-distinct-members
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Count known buyers once regardless of repeat purchases.
seo_title: Count distinct known identities | Data Analysis Using SQL
seo_description: Count known buyers once regardless of repeat purchases.
seo_keywords:
- SQL
- PostgreSQL
- Count distinct known identities
sql:
  seed: seed.sql
---

# Count distinct known identities

COUNT(DISTINCT key) counts unique non-NULL values of one expression. It answers how many known identities occur, not how many activity rows occurred. This is different from selecting distinct rows for a later join.

The reading table contains repeated visits, but the aggregate counts readers once. A NULL reader would not be a known identity to count. Keep that missing-identity policy visible when interpreting a buyer or retention denominator.

```sql run
SELECT COUNT(DISTINCT reader) AS readers
FROM visits;
```
