---
title: Normalize case with LOWER
slug: lowercase-labels
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Give equivalent label casing a common representation.
seo_title: Normalize case with LOWER | Data Analysis Using SQL
seo_description: Give equivalent label casing a common representation.
seo_keywords:
- SQL
- PostgreSQL
- Normalize case with LOWER
sql:
  seed: seed.sql
---

# Normalize case with LOWER

LOWER gives equivalent letter casing a shared representation. It does not identify whether two labels refer to the same real place. Use the preceding TRIM operation first when spaces are also insignificant. Keep identifiers so cleaning does not erase the identity of imported rows.

The nested expression works from the inside out: trim first, then lowercase the result. Labels with different original casing can now have the same display.

```sql run
SELECT parcel_id,
       LOWER(TRIM(site)) AS normalized_region
FROM labels
ORDER BY parcel_id;
```
