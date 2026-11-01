---
title: 'Exercise: Add a column with ALTER TABLE'
slug: exercise-add-column
order: 20
language: sql
lesson_type: coding
runtime: sql
summary: Add a field while preserving an existing table's rows.
seo_title: 'Exercise: Add a column with ALTER TABLE | Introduction to SQL'
seo_description: Add a field while preserving an existing table's rows.
seo_keywords:
  - SQL
  - PostgreSQL
  - Add a column with ALTER TABLE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - kit_id
    - name
    - inspected
  expected_row_count: 2
  expected_rows:
    - - 10
      - Mending
      - false
    - - 20
      - Sketching
      - false
hints:
  - ADD COLUMN changes the definition; the default supplies old rows with a value.
---

# Exercise: Add a column with ALTER TABLE

The kits already exist. The coordinator now needs to track whether each kit has been inspected.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `kits`

One row represents one tool-kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `kit_id` · `integer` | Identifier of the kit record. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Kit display name. | Required; cannot be `NULL`. |

### After the schema change

The following is the resulting shape. The starting dictionary above describes what is available before the change.

#### `kits`

One row represents one tool-kit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `kit_id` · `integer` | Identifier of the kit record. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Kit display name. | Required; cannot be `NULL`. |
| `inspected` · `boolean` | Inspection flag: true means inspected; false means not inspected. | Required; cannot be `NULL`. Default `false` when omitted. |

## Your Task

1. Add inspected boolean NOT NULL DEFAULT false to kits. Return kit_id, name, inspected ordered by kit_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
