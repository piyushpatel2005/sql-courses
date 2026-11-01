---
title: 'Exercise: Combine distinct rows with UNION'
slug: exercise-union-results
order: 10
language: sql
lesson_type: coding
runtime: sql
summary: Combine two lists and remove equal result rows.
seo_title: 'Exercise: Combine distinct rows with UNION | Introduction to SQL'
seo_description: Combine two lists and remove equal result rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Combine distinct rows with UNION
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 3
  expected_rows:
    - - Bela
    - - Dara
    - - Esme
hints:
  - UNION compares complete selected rows and removes duplicates.
---

# Exercise: Combine distinct rows with UNION

Create one invitation list from the north and south teams. Dara should appear once even though several source records contain that name.

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

1. Return name from north_invites UNION name from south_invites, ordered alphabetically. Use UNION to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
