---
title: Normalize letter case with LOWER
slug: lower-text
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label in lowercase.
seo_title: Normalize letter case with LOWER | Introduction to SQL
seo_description: Display a label in lowercase.
seo_keywords:
- SQL
- PostgreSQL
- Normalize letter case with LOWER
sql:
  seed: seed.sql
---

# Normalize letter case with LOWER

LOWER converts letters to lowercase. It does not remove spaces, validate a name, or identify duplicate people. When labels should ignore case, normalize before grouping them.

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

The result changes FIELD to field but keeps the raw surrounding spaces. Case conversion and trimming are separate operations.

```sql run
SELECT parcel_id,
       LOWER(label) AS lower_label
FROM parcels
ORDER BY parcel_id;
```
