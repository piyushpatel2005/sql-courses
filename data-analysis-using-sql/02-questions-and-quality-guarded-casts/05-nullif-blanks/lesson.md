---
title: Mark a blank as missing with NULLIF
slug: nullif-blanks
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Treat an empty cleaned label as missing.
seo_title: Mark a blank as missing with NULLIF | Data Analysis Using SQL
seo_description: Treat an empty cleaned label as missing.
seo_keywords:
- SQL
- PostgreSQL
- Mark a blank as missing with NULLIF
sql:
  seed: seed.sql
---

# Mark a blank as missing with NULLIF

NULLIF(value, comparison) returns NULL when the values are equal and the first value otherwise. A blank imported label is not a known location. After the previously taught trimming and lowercasing, compare it with an empty string to represent that missingness explicitly.

Inspect the spaces-only label after trimming. NULLIF turns its empty string into NULL, while a known pickup label remains a value.

```sql run
SELECT parcel_id,
       NULLIF(LOWER(TRIM(site)),
       '') AS region
FROM labels
ORDER BY parcel_id;
```
