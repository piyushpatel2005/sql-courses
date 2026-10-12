---
title: Keep every occurrence with UNION ALL
slug: union-all
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Append two lists while retaining every occurrence.
seo_title: Keep every occurrence with UNION ALL | Introduction to SQL
seo_description: Append two lists while retaining every occurrence.
seo_keywords:
- SQL
- PostgreSQL
- Keep every occurrence with UNION ALL
sql:
  seed: seed.sql
---

# Keep every occurrence with UNION ALL

UNION ALL appends all input rows, including repeated values. Use it when each occurrence represents an observation you must retain. UNION would instead discard equal result rows, even when they came from different real events.

Bo appears for each contributing membership row. Count those occurrences before comparing this result with UNION: retaining them is the purpose of ALL.

```sql run
SELECT name
FROM garden_club
UNION ALL
SELECT name
FROM repair_club
ORDER BY name;
```
