---
title: Normalize letter case with LOWER
slug: lower-text
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label in lowercase.
seo_title: Normalize letter case with LOWER | Introduction to SQL
seo_description: Display a label in lowercase.
seo_keywords:
- SQL
- PostgreSQL
- Normalize letter case with LOWER
sql:
  seed: seed.sql
---

# Normalize letter case with LOWER

LOWER converts letters to lowercase. It does not remove spaces, validate a name, or identify duplicate people. When labels should ignore case, normalize before grouping them.

The result changes FIELD to field but keeps the raw surrounding spaces. Case conversion and trimming are separate operations.

```sql run
SELECT parcel_id,
       LOWER(label) AS lower_label
FROM parcels
ORDER BY parcel_id;
```
