---
title: Round a packing count upward with CEIL
slug: ceil-numbers
order: 17
language: sql
lesson_type: interactive
runtime: sql
summary: Allow a whole container for a partly filled remainder.
seo_title: Round a packing count upward with CEIL | Introduction to SQL
seo_description: Allow a whole container for a partly filled remainder.
seo_keywords:
- SQL
- PostgreSQL
- Round a packing count upward with CEIL
sql:
  seed: seed.sql
---

# Round a packing count upward with CEIL

CEIL returns the smallest integer value not below its input. A partly filled container still needs a whole container, so upward rounding fits a packing estimate. Use a decimal divisor to preserve the fraction before applying CEIL.

The 5.2-unit parcel needs three two-unit containers. A partly used last container still counts.

```sql run
SELECT parcel_id,
       CEIL(weight / 2.0) AS boxes
FROM parcels
ORDER BY parcel_id;
```
