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

For this estimate, assume the contents can be divided among containers holding at most two kilograms each. The 5.2-kilogram parcel then needs three containers by weight; a partly used last container still counts. This calculation does not check dimensions or whether an indivisible object fits. The exercise uses a simpler model of individual items and a box's item capacity.

```sql run
SELECT parcel_id,
       CEIL(weight / 2.0) AS boxes
FROM parcels
ORDER BY parcel_id;
```
