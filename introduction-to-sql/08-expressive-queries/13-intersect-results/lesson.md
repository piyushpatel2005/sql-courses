---
title: Keep shared rows with INTERSECT
slug: intersect-results
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Keep the distinct rows shared by two results.
seo_title: Keep shared rows with INTERSECT | Introduction to SQL
seo_description: Keep the distinct rows shared by two results.
seo_keywords:
- SQL
- PostgreSQL
- Keep shared rows with INTERSECT
sql:
  seed: seed.sql
---

# Keep shared rows with INTERSECT

INTERSECT returns distinct rows present in both inputs. It compares complete selected rows, not just the first column. A name repeated several times in both lists still appears once without ALL.

Only names shared by both clubs remain. Adding another copy of Bo to either input would not add another row to this distinct overlap.

```sql run
SELECT name
FROM garden_club
INTERSECT
SELECT name
FROM repair_club
ORDER BY name;
```
