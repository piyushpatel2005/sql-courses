---
title: Choose a display fallback with COALESCE
slug: coalesce-labels
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Display unknown for a missing cleaned region.
seo_title: Choose a display fallback with COALESCE | Data Analysis Using SQL
seo_description: Display unknown for a missing cleaned region.
seo_keywords:
- SQL
- PostgreSQL
- Choose a display fallback with COALESCE
sql:
  seed: seed.sql
---

# Choose a display fallback with COALESCE

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

COALESCE chooses the first non-NULL argument. A report can show unknown without overwriting the cleaned field. An empty string is still a value, so use the preceding NULLIF step before adding a display fallback. A label is a presentation policy, not evidence that the source is complete.

The fallback now labels both an absent input and a blank cleaned input as unknown. Neither becomes a known pickup site just because the report has readable text.

```sql run
SELECT parcel_id,
       COALESCE(NULLIF(LOWER(TRIM(site)),
       ''),
       'unknown') AS region
FROM labels
ORDER BY parcel_id;
```
