---
title: Keep every occurrence with UNION ALL
slug: union-all
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Append two lists while retaining every occurrence.
seo_title: Keep every occurrence with UNION ALL | Introduction to SQL
seo_description: Append two lists while retaining every occurrence.
seo_keywords:
- SQL
- PostgreSQL
- Keep every occurrence with UNION ALL
sql:
  seed: seed.sql
---

# Keep every occurrence with UNION ALL

UNION ALL appends all input rows, including repeated values. Use it when each occurrence represents an observation you must retain. UNION would instead discard equal result rows, even when they came from different real events.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `garden_club`

One row represents one recorded club-membership name.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Member name used as the invitation label, not a verified person identifier. | Nullable; `NULL` means no name value is recorded. |

No key or foreign key is declared. Names can repeat, and equal names need not identify the same real person. Set operations compare the selected name values rather than joining identities.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

#### `repair_club`

One row represents one recorded club-membership name.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Member name used as the invitation label, not a verified person identifier. | Nullable; `NULL` means no name value is recorded. |

No key or foreign key is declared. Names can repeat, and equal names need not identify the same real person. Set operations compare the selected name values rather than joining identities.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

Bo appears for each contributing membership row. Count those occurrences before comparing this result with UNION: retaining them is the purpose of ALL.

```sql run
SELECT name
FROM garden_club
UNION ALL
SELECT name
FROM repair_club
ORDER BY name;
```
