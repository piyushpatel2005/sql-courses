---
title: Subtract one result with EXCEPT
slug: except-results
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Find rows present in the first list but absent from the second.
seo_title: Subtract one result with EXCEPT | Introduction to SQL
seo_description: Find rows present in the first list but absent from the second.
seo_keywords:
- SQL
- PostgreSQL
- Subtract one result with EXCEPT
sql:
  seed: seed.sql
---

# Subtract one result with EXCEPT

EXCEPT returns distinct rows from the first input that do not appear in the second. Direction matters: reversing the inputs asks the opposite question. This is result filtering, not deletion from either source.

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

Bo is removed because the repair club also contains that name. Reversing the inputs would instead find repair-club names absent from the garden club. When combining several different set operators, use parentheses to make the intended grouping explicit.

```sql run
SELECT name
FROM garden_club
EXCEPT
SELECT name
FROM repair_club
ORDER BY name;
```
