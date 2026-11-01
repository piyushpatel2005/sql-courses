---
title: 'Exercise: a storage-bin table'
slug: exercise-create-types
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Define an empty table with types chosen for its fields.
seo_title: 'Exercise: a storage-bin table | Introduction to SQL'
seo_description: Define an empty table with types chosen for its fields.
seo_keywords:
- SQL
- PostgreSQL
- exercise create types
hints:
- CREATE TABLE declares columns; the final SELECT only displays their shape.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - bin_id
  - label
  - capacity
  expected_row_count: 0
  expected_rows: []
---

# Exercise: a storage-bin table

The result checks confirm the selected column names and empty rows. They do not independently verify the table name or declared types; compare your definition with the requested design.

## Data model

### Exercise data

This exercise starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `storage_bins`

One row represents one storage bin to be created.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `bin_id` · `integer` | Intended identifier of the bin. | Nullable; `NULL` means the identifier is unrecorded. |
| `label` · `text` | Readable bin label. | Nullable; `NULL` means no label value is recorded. |
| `capacity` · `integer` | Whole-number count of storage slots in the bin. | Nullable; `NULL` means the capacity is unrecorded, not zero. |

This first design does not yet enforce unique identifiers or positive capacities.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

The storage coordinator needs a new table, not a new query on the gear catalog. Start with an empty database and choose the requested column types. The final SELECT lets you inspect the shape even before any bins exist.

Each future row represents one storage bin. `bin_id` is its intended identifier, `label` is readable text, and `capacity` counts storage slots, so a whole-number type fits. This first definition does not yet enforce unique identifiers or positive capacities; practice the column structure before adding those constraints.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
-- No tables are needed before this exercise.
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Create an empty `storage_bins` table with `bin_id integer`, `label text`, and `capacity integer`. Finish by selecting these three columns in that order.

The final result is empty, with columns `bin_id`, `label`, `capacity`. Empty rows alone do not verify your table definition.
