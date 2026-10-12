---
title: Subtract one result with EXCEPT
slug: except-results
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Find rows present in the first list but absent from the second.
seo_title: Subtract one result with EXCEPT | Introduction to SQL
seo_description: Find rows present in the first list but absent from the second.
seo_keywords:
- SQL
- PostgreSQL
- Subtract one result with EXCEPT
sql:
  seed: seed.sql
---

# Subtract one result with EXCEPT

EXCEPT returns distinct rows from the first input that do not appear in the second. Direction matters: reversing the inputs asks the opposite question. This is result filtering, not deletion from either source.

Bo is removed because the repair club also contains that name. Reversing the inputs would instead find repair-club names absent from the garden club. When combining several different set operators, use parentheses to make the intended grouping explicit.

```sql run
SELECT name
FROM garden_club
EXCEPT
SELECT name
FROM repair_club
ORDER BY name;
```
