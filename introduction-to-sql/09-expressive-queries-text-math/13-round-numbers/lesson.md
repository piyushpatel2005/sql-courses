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

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `parcels`

One row represents one parcel record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `parcel_id` · `integer` | Intended record identifier, used for ordering but not declared as a key. | Nullable; `NULL` means the identifier is unrecorded. |
| `label` · `text` | Raw parcel label, including its original spaces and letter case. | Nullable; `NULL` means no label value is recorded. |
| `weight` · `numeric` | Parcel mass in kilograms; unconstrained `numeric` has no declared precision or scale. | Nullable; `NULL` means the weight is unrecorded, not zero. |

No primary key or positive-weight check is declared. These records are separate from the later shipment fixture.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

The 5.2 weight rounds to a whole displayed number. The stored measurement remains 5.2.

```sql run
SELECT parcel_id,
       ROUND(weight,
       0) AS rounded_weight
FROM parcels
ORDER BY parcel_id;
```
