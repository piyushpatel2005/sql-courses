---
title: 'Exercise: Remove a table with DROP TABLE'
slug: exercise-drop-table
order: 6
language: sql
lesson_type: coding
runtime: sql
summary: Remove an obsolete table without removing the live catalog.
seo_title: 'Exercise: Remove a table with DROP TABLE | Introduction to SQL'
seo_description: Remove an obsolete table without removing the live catalog.
seo_keywords:
  - SQL
  - PostgreSQL
  - Remove a table with DROP TABLE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - kit_id
    - name
  expected_row_count: 2
  expected_rows:
    - - 10
      - Mending
    - - 20
      - Sketching
hints:
  - Name only the retired table in DROP TABLE; inspect the live table afterward.
---

# Exercise: Remove a table with DROP TABLE

The desk has retired an old import table. Its live kits table must stay available.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `kits`

One row represents one tool-kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `kit_id` · `integer` | Identifier of the kit record. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Kit display name. | Required; cannot be `NULL`. |

#### `old_kits`

One row represents one obsolete imported kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Imported kit name. | Nullable; `NULL` means no name value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### State for this lesson

`old_kits` is the removal target. `kits` is the separate live register and keeps its own key and required name.

## Your Task

1. Drop old_kits, then return kit_id and name from kits ordered by kit_id. The output check does not verify table removal.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
