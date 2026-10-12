---
title: Trim surrounding spaces with TRIM
slug: trim-text
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Remove spaces around a label without removing internal spaces.
seo_title: Trim surrounding spaces with TRIM | Introduction to SQL
seo_description: Remove spaces around a label without removing internal spaces.
seo_keywords:
- SQL
- PostgreSQL
- Trim surrounding spaces with TRIM
sql:
  seed: seed.sql
---

# Trim surrounding spaces with TRIM

TRIM removes spaces from the beginning and end of a text value. It does not remove spaces between words. Cleaning a selected expression leaves the stored source untouched.

Look at the space between River and Bowl: TRIM keeps it while removing the spaces around the label.

```sql run
SELECT parcel_id,
       TRIM(label) AS clean_label
FROM parcels
ORDER BY parcel_id;
```
