---
title: Combine distinct rows with UNION
slug: union-results
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Combine two lists and remove equal result rows.
seo_title: Combine distinct rows with UNION | Introduction to SQL
seo_description: Combine two lists and remove equal result rows.
seo_keywords:
- SQL
- PostgreSQL
- Combine distinct rows with UNION
sql:
  seed: seed.sql
---

# Combine distinct rows with UNION

UNION combines compatible result rows and removes duplicates. Unlike a join, it adds rows rather than attaching columns. Each input must have the same number of columns with compatible types; their meanings should match too.

Bo belongs to both clubs but appears once in the result. The final ORDER BY sorts the combined list, whose output name comes from the first SELECT.

```sql run
SELECT name
FROM garden_club
UNION
SELECT name
FROM repair_club
ORDER BY name;
```
