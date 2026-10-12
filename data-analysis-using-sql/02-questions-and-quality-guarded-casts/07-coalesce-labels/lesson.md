---
title: Choose a display fallback with COALESCE
slug: coalesce-labels
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Display unknown for a missing cleaned region.
seo_title: Choose a display fallback with COALESCE | Data Analysis Using SQL
seo_description: Display unknown for a missing cleaned region.
seo_keywords:
- SQL
- PostgreSQL
- Choose a display fallback with COALESCE
sql:
  seed: seed.sql
---

# Choose a display fallback with COALESCE

COALESCE chooses the first non-NULL argument. A report can show unknown without overwriting the cleaned field. An empty string is still a value, so use the preceding NULLIF step before adding a display fallback. A label is a presentation policy, not evidence that the source is complete.

The fallback now labels both an absent input and a blank cleaned input as unknown. Neither becomes a known pickup site just because the report has readable text.

```sql run
SELECT parcel_id,
       COALESCE(NULLIF(LOWER(TRIM(site)),
       ''),
       'unknown') AS region
FROM labels
ORDER BY parcel_id;
```
