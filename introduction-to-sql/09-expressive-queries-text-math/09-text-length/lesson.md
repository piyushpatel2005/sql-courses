---
title: Count characters with CHAR_LENGTH
slug: text-length
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Count the characters in a raw label, including spaces.
seo_title: Count characters with CHAR_LENGTH | Introduction to SQL
seo_description: Count the characters in a raw label, including spaces.
seo_keywords:
- SQL
- PostgreSQL
- Count characters with CHAR_LENGTH
sql:
  seed: seed.sql
---

# Count characters with CHAR_LENGTH

CHAR_LENGTH counts characters in a text value, including spaces. It does not count words or reliably measure how much space a label will occupy on screen. A missing input returns NULL.

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

Surrounding spaces contribute to the character count. A label can look short on screen and still contain those characters.

```sql run
SELECT parcel_id,
       CHAR_LENGTH(label) AS characters
FROM parcels
ORDER BY parcel_id;
```
