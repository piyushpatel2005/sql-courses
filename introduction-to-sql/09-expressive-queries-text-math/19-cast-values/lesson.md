---
title: Convert a value with CAST
slug: cast-values
order: 19
language: sql
lesson_type: interactive
runtime: sql
summary: Convert an integer before division so the fraction is retained.
seo_title: Convert a value with CAST | Introduction to SQL
seo_description: Convert an integer before division so the fraction is retained.
seo_keywords:
- SQL
- PostgreSQL
- Convert a value with CAST
sql:
  seed: seed.sql
---

# Convert a value with CAST

CAST(value AS type) explicitly converts a value to another type. A cast can fail when the value is not valid for the target type. Converting an integer to numeric before division preserves fractions; it does not change the original column type.

The selected weight is now text. The packing exercise uses a different conversion: it makes the numerator numeric before division.

```sql run
SELECT parcel_id,
       CAST(weight AS text) AS weight_text
FROM parcels
ORDER BY parcel_id;
```
