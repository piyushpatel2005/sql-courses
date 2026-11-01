---
title: Extract part of a value with SUBSTRING
slug: substring-text
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Extract characters using a one-based starting position.
seo_title: Extract part of a value with SUBSTRING | Introduction to SQL
seo_description: Extract characters using a one-based starting position.
seo_keywords:
- SQL
- PostgreSQL
- Extract part of a value with SUBSTRING
sql:
  seed: seed.sql
---

# Extract part of a value with SUBSTRING

SUBSTRING(text FROM start FOR count) extracts a section of text. Positions start at one. Spaces count as characters, so trimming first is a separate decision; this example intentionally uses the raw value.

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

The prefix starts at the raw value, including any leading spaces. Trimming first would change which characters occupy these positions.

```sql run
SELECT parcel_id,
       SUBSTRING(label
FROM 1 FOR 4) AS prefix
FROM parcels
ORDER BY parcel_id;
```
