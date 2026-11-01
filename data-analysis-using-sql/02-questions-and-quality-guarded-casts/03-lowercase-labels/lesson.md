---
title: Normalize case with LOWER
slug: lowercase-labels
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Give equivalent label casing a common representation.
seo_title: Normalize case with LOWER | Data Analysis Using SQL
seo_description: Give equivalent label casing a common representation.
seo_keywords:
- SQL
- PostgreSQL
- Normalize case with LOWER
sql:
  seed: seed.sql
---

# Normalize case with LOWER

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `labels`

One row represents one received parcel label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `parcel_id` · `integer` | Parcel record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `site` · `text` | Raw pickup-site text, including original spaces and letter case; blanks are present text, not SQL NULL. | Nullable; `NULL` means no site value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

LOWER gives equivalent letter casing a shared representation. It does not identify whether two labels refer to the same real place. Use the preceding TRIM operation first when spaces are also insignificant. Keep identifiers so cleaning does not erase the identity of imported rows.

The nested expression works from the inside out: trim first, then lowercase the result. Labels with different original casing can now have the same display.

```sql run
SELECT parcel_id,
       LOWER(TRIM(site)) AS normalized_region
FROM labels
ORDER BY parcel_id;
```
