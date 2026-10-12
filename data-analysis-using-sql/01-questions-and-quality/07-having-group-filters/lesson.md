---
title: Filter completed groups with HAVING
slug: having-group-filters
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Select repeated-key groups after their counts are known.
seo_title: Filter completed groups with HAVING | Data Analysis Using SQL
seo_description: Select repeated-key groups after their counts are known.
seo_keywords:
- SQL
- PostgreSQL
- Filter completed groups with HAVING
sql:
  seed: seed.sql
---

# Filter completed groups with HAVING

HAVING tests a condition after groups have been formed. WHERE tests individual input rows before that happens. A repeated-key diagnostic therefore uses HAVING COUNT(*) > 1 rather than trying to put the aggregate in WHERE.

Start with the grouped counts from the preceding lesson and retain only keys with several records. A repeated business key is a reason to investigate, not an automatic deletion rule: the rows may be revisions or legitimate separate events.

```sql run
SELECT reader_ref,COUNT(*) AS copies
FROM imports
GROUP BY reader_ref
HAVING COUNT(*) > 1
ORDER BY reader_ref;
```
