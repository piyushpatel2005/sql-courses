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

Compare weights above and below the target. ABS removes the sign, so the result alone cannot tell you which side they came from.

```sql run
SELECT parcel_id,
       ABS(weight - 4) AS distance_from_target
FROM parcels
ORDER BY parcel_id;
```
