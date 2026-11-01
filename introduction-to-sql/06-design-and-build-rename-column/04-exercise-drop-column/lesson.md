---
title: 'Exercise: Remove one column with DROP COLUMN'
slug: exercise-drop-column
order: 4
language: sql
lesson_type: coding
runtime: sql
summary: Remove a temporary field while keeping the rest of the table.
seo_title: 'Exercise: Remove one column with DROP COLUMN | Introduction to SQL'
seo_description: Remove a temporary field while keeping the rest of the table.
seo_keywords:
  - SQL
  - PostgreSQL
  - Remove one column with DROP COLUMN
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
  - Use ALTER TABLE with DROP COLUMN, not DROP TABLE.
---

# Exercise: Remove one column with DROP COLUMN

A temporary import marker is no longer needed, but the kit names must remain.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `kits`

One row represents one tool-kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `kit_id` · `integer` | Identifier of the kit record. | Nullable; `NULL` means the identifier is unrecorded. |
| `name` · `text` | Kit display name. | Nullable; `NULL` means no name value is recorded. |
| `import_note` · `text` | Temporary import marker that this lesson removes. | Nullable; `NULL` means no import note value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### After the schema change

The following is the resulting shape. The starting dictionary above describes what is available before the change.

#### `kits`

One row represents one tool-kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `kit_id` · `integer` | Identifier of the kit record. | Nullable; `NULL` means the identifier is unrecorded. |
| `name` · `text` | Kit display name. | Nullable; `NULL` means no name value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### State for this lesson

After the change, `import_note` no longer exists. This particular `kits` fixture declares no primary key or required-value constraints, unlike some earlier kit lessons.

## Your Task

1. Drop the import_note column from kits. Return kit_id and name ordered by kit_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
