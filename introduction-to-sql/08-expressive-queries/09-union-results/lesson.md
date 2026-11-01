---
title: Combine distinct rows with UNION
slug: union-results
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Combine two lists and remove equal result rows.
seo_title: Combine distinct rows with UNION | Introduction to SQL
seo_description: Combine two lists and remove equal result rows.
seo_keywords:
- SQL
- PostgreSQL
- Combine distinct rows with UNION
sql:
  seed: seed.sql
---

# Combine distinct rows with UNION

UNION combines compatible result rows and removes duplicates. Unlike a join, it adds rows rather than attaching columns. Each input must have the same number of columns with compatible types; their meanings should match too.

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

Bo belongs to both clubs but appears once in the result. The final ORDER BY sorts the combined list, whose output name comes from the first SELECT.

Each source row records a club membership name. This small example treats equal names as the same invitation label; `UNION` compares values, not real-world identities. In a real contact system, select a stable person identifier too, or two different people with the same name could collapse into one result row. The next exercise likewise asks for distinct name values, not a verified count of distinct people.

```sql run
SELECT name
FROM garden_club
UNION
SELECT name
FROM repair_club
ORDER BY name;
```
