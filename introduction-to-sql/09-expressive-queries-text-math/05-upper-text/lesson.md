---
title: Make an uppercase label with UPPER
slug: upper-text
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label in uppercase.
seo_title: Make an uppercase label with UPPER | Introduction to SQL
seo_description: Display a label in uppercase.
seo_keywords:
- SQL
- PostgreSQL
- Make an uppercase label with UPPER
sql:
  seed: seed.sql
---

# Make an uppercase label with UPPER

UPPER converts letters to uppercase. It changes the selected display value, not the table. Use it when a label convention calls for uppercase rather than treating uppercase as more correct data.

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

River Bowl becomes uppercase, but its spaces remain. Compare the transformed label with the seed before adding another cleaning function.

```sql run
SELECT parcel_id,
       UPPER(label) AS upper_label
FROM parcels
ORDER BY parcel_id;
```
