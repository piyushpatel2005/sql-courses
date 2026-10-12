---
title: Round numeric output with ROUND
slug: round-numbers
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Round a fractional calculation to a stated precision.
seo_title: Round numeric output with ROUND | Introduction to SQL
seo_description: Round a fractional calculation to a stated precision.
seo_keywords:
- SQL
- PostgreSQL
- Round numeric output with ROUND
sql:
  seed: seed.sql
---

# Round numeric output with ROUND

ROUND(value, digits) rounds an exact numeric value for the requested precision. It does not mean that the original measurement was that precise. Keep calculations at useful precision and round the final display when appropriate.

The 5.2 weight rounds to a whole displayed number. The stored measurement remains 5.2.

```sql run
SELECT parcel_id,
       ROUND(weight,
       0) AS rounded_weight
FROM parcels
ORDER BY parcel_id;
```
