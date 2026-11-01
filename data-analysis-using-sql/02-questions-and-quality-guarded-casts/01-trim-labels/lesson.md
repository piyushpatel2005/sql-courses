---
title: Remove surrounding spaces with TRIM
slug: trim-labels
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Remove surrounding spaces while preserving imported row identity.
seo_title: Remove surrounding spaces with TRIM | Data Analysis Using SQL
seo_description: Remove surrounding spaces while preserving imported row identity.
seo_keywords:
- SQL
- PostgreSQL
- Remove surrounding spaces with TRIM
sql:
  seed: seed.sql
---

# Remove surrounding spaces with TRIM

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

A pickup label may be correct except for spaces around it. TRIM removes those surrounding spaces, not the space between two words. It leaves NULL as NULL and can turn a spaces-only input into an empty string. A query transformation keeps the raw value available for review.

Compare the padded label with the spaces-only input. Trimming leaves a meaningful name in one case and an empty string in the other.

```sql run
SELECT parcel_id,
       TRIM(site) AS trimmed_region
FROM labels
ORDER BY parcel_id;
```
