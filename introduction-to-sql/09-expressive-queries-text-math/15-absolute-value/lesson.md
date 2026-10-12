---
title: Measure a magnitude with ABS
slug: absolute-value
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Measure how far a quantity lies from a target, ignoring direction.
seo_title: Measure a magnitude with ABS | Introduction to SQL
seo_description: Measure how far a quantity lies from a target, ignoring direction.
seo_keywords:
- SQL
- PostgreSQL
- Measure a magnitude with ABS
sql:
  seed: seed.sql
---

# Measure a magnitude with ABS

ABS returns the magnitude of a number without its sign. It is useful for the size of a difference, but it discards direction. Do not use it when the report must distinguish a surplus from a shortage.

Compare weights above and below the target. ABS removes the sign, so the result alone cannot tell you which side they came from.

```sql run
SELECT parcel_id,
       ABS(weight - 4) AS distance_from_target
FROM parcels
ORDER BY parcel_id;
```
