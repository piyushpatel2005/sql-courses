---
title: Remove surrounding spaces with TRIM
slug: trim-labels
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Remove surrounding spaces while preserving imported row identity.
seo_title: Remove surrounding spaces with TRIM | Data Analysis Using SQL
seo_description: Remove surrounding spaces while preserving imported row identity.
seo_keywords:
- SQL
- PostgreSQL
- Remove surrounding spaces with TRIM
sql:
  seed: seed.sql
---

# Remove surrounding spaces with TRIM

A pickup label may be correct except for spaces around it. TRIM removes those surrounding spaces, not the space between two words. It leaves NULL as NULL and can turn a spaces-only input into an empty string. A query transformation keeps the raw value available for review.

Compare the padded label with the spaces-only input. Trimming leaves a meaningful name in one case and an empty string in the other.

```sql run
SELECT parcel_id,
       TRIM(site) AS trimmed_region
FROM labels
ORDER BY parcel_id;
```
