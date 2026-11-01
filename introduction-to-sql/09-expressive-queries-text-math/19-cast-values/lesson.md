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

The selected weight is now text. The packing exercise uses a different conversion: it makes the numerator numeric before division.

In `CAST(weight AS text)`, `AS text` belongs inside the conversion parentheses; `AS weight_text` outside them names the output column. For division, compare `7 / 4`, which returns 1, with `CAST(7 AS numeric) / 4`, which retains 1.75. Casting the already-truncated answer, `CAST(7 / 4 AS numeric)`, still gives 1. Choose the operand type before the calculation that needs its precision.

```sql run
SELECT parcel_id,
       CAST(weight AS text) AS weight_text
FROM parcels
ORDER BY parcel_id;
```
