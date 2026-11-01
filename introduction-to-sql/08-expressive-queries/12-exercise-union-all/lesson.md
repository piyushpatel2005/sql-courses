---
title: 'Exercise: Keep every occurrence with UNION ALL'
slug: exercise-union-all
order: 12
language: sql
lesson_type: coding
runtime: sql
summary: Append two lists while retaining every occurrence.
seo_title: 'Exercise: Keep every occurrence with UNION ALL | Introduction to SQL'
seo_description: Append two lists while retaining every occurrence.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep every occurrence with UNION ALL
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 5
  expected_rows:
    - - Bela
    - - Dara
    - - Dara
    - - Dara
    - - Esme
hints:
  - UNION ALL keeps repeated values both within and across its inputs.
---

# Exercise: Keep every occurrence with UNION ALL

The coordinator is auditing how many invitation records arrived. Retain every occurrence, including repeated records for Dara.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `north_invites`

One row represents one invitation record from the north team.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Invitee name label on this record, not a verified person identifier. | Nullable; `NULL` means no name value is recorded. |

No key or foreign key is declared. Repeated records are allowed; equal names do not establish a real-world identity. The two lists have compatible text columns, not a foreign-key relationship.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

#### `south_invites`

One row represents one invitation record from the south team.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Invitee name label on this record, not a verified person identifier. | Nullable; `NULL` means no name value is recorded. |

No key or foreign key is declared. Repeated records are allowed; equal names do not establish a real-world identity. The two lists have compatible text columns, not a foreign-key relationship.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

## Your Task

1. Return name from north_invites UNION ALL name from south_invites, ordered alphabetically. Use UNION ALL to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
