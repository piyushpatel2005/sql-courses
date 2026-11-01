---
title: Join text values with concatenation
slug: concatenate-text
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Append a literal suffix to a stored label.
seo_title: Join text values with concatenation | Introduction to SQL
seo_description: Append a literal suffix to a stored label.
seo_keywords:
- SQL
- PostgreSQL
- Join text values with concatenation
sql:
  seed: seed.sql
---

# Join text values with concatenation

The PostgreSQL operator || joins text into one value. A literal separator is part of the expression. If either input is NULL, ordinary concatenation returns NULL; use the previously taught COALESCE when an explicit fallback is intended.

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

The suffix adds its own separating space. Existing trailing spaces in the source remain too; concatenation does not clean them.

```sql run
SELECT parcel_id,
       label || ' parcel' AS display_label
FROM parcels
ORDER BY parcel_id;
```
