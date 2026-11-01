---
title: 'Exercise: Subtract one result with EXCEPT'
slug: exercise-except-results
order: 16
language: sql
lesson_type: coding
runtime: sql
summary: Find rows present in the first list but absent from the second.
seo_title: 'Exercise: Subtract one result with EXCEPT | Introduction to SQL'
seo_description: Find rows present in the first list but absent from the second.
seo_keywords:
  - SQL
  - PostgreSQL
  - Subtract one result with EXCEPT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 1
  expected_rows:
    - - Bela
hints:
  - EXCEPT is directional; put the population you want to keep first.
---

# Exercise: Subtract one result with EXCEPT

Find the north-team invitees who are absent from the south list. Reversing the lists would answer the south team's question instead.

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

1. Return name from north_invites EXCEPT name from south_invites, ordered alphabetically. Use EXCEPT to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
