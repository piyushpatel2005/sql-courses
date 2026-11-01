---
title: 'Exercise: Keep shared rows with INTERSECT'
slug: exercise-intersect-results
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Keep the distinct rows shared by two results.
seo_title: 'Exercise: Keep shared rows with INTERSECT | Introduction to SQL'
seo_description: Keep the distinct rows shared by two results.
seo_keywords:
  - SQL
  - PostgreSQL
  - Keep shared rows with INTERSECT
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
  expected_row_count: 1
  expected_rows:
    - - Dara
hints:
  - INTERSECT keeps membership in both inputs rather than appending the inputs.
---

# Exercise: Keep shared rows with INTERSECT

Find names present in both neighborhood invitation lists. A name should appear once in this overlap report even when it was submitted repeatedly.

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

1. Return name from north_invites INTERSECT name from south_invites, ordered alphabetically. Use INTERSECT to express the requested row combination.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
