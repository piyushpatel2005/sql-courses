---
title: Trim surrounding spaces with TRIM
slug: trim-text
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Remove spaces around a label without removing internal spaces.
seo_title: Trim surrounding spaces with TRIM | Introduction to SQL
seo_description: Remove spaces around a label without removing internal spaces.
seo_keywords:
- SQL
- PostgreSQL
- Trim surrounding spaces with TRIM
sql:
  seed: seed.sql
---

# Trim surrounding spaces with TRIM

The previous section chose a fallback for missing text. Recorded text can need attention too: these parcel labels contain extra spaces. We will change one aspect of a displayed value at a time, without rewriting the stored input.

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

Spaces are deliberately retained in the raw labels so you can see which transformation removes them. The next exercise uses separate packing records and item counts rather than parcel weights.

A function such as `TRIM(label)` takes its input inside parentheses and returns one value per row. You can select that value with an alias just like arithmetic; a function in SELECT does not update the source column.

TRIM removes spaces from the beginning and end of a text value. It does not remove spaces between words. Cleaning a selected expression leaves the stored source untouched.

Look at the space between River and Bowl: TRIM keeps it while removing the spaces around the label.

```sql run
SELECT parcel_id,
       TRIM(label) AS clean_label
FROM parcels
ORDER BY parcel_id;
```
