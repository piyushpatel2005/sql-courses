---
title: Join text values with concatenation
slug: concatenate-text
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Append a literal suffix to a stored label.
seo_title: Join text values with concatenation | Introduction to SQL
seo_description: Append a literal suffix to a stored label.
seo_keywords:
- SQL
- PostgreSQL
- Join text values with concatenation
sql:
  seed: seed.sql
---

# Join text values with concatenation

The PostgreSQL operator || joins text into one value. A literal separator is part of the expression. If either input is NULL, ordinary concatenation returns NULL; use the previously taught COALESCE when an explicit fallback is intended.

The suffix adds its own separating space. Existing trailing spaces in the source remain too; concatenation does not clean them.

```sql run
SELECT parcel_id,
       label || ' parcel' AS display_label
FROM parcels
ORDER BY parcel_id;
```
