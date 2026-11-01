---
title: Rename a column without replacing its values
slug: rename-column
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Change a column's name without replacing its stored values.
seo_title: Rename a column without replacing its values | Introduction to SQL
seo_description: Change a column's name without replacing its stored values.
seo_keywords:
- SQL
- PostgreSQL
- Rename a column without replacing its values
sql:
  seed: seed.sql
---

# Rename a column without replacing its values

ALTER TABLE ... RENAME COLUMN ... TO ... changes a field name, not the data in it. Queries using the old name must be updated. Check dependent code before renaming a production column.

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

### Before the rename

#### `rename_demo`

One row represents one disposable museum-label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `id` · `integer` | Intended identifier of the demo record. | Nullable; `NULL` means the identifier is unrecorded. |
| `title` · `text` | Label text before the rename. | Nullable; `NULL` means no title value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### After the rename

#### `rename_demo`

One row represents one disposable museum-label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `id` · `integer` | Intended identifier of the demo record. | Nullable; `NULL` means the identifier is unrecorded. |
| `label` · `text` | The same text after `title` is renamed to `label`. | Nullable; `NULL` means no label value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### State for this lesson

The demo creates `rename_demo` itself, renames `title` to `label`, then reads `label`. The old field name is not available after the rename; neither identifier nor label has a key constraint.

This disposable demo recreates its own table before each Run so the old name is present. DROP removes that demo table; a dedicated lesson shortly explains removal. The rename is the operation to inspect here.

```sql run
DROP TABLE IF EXISTS rename_demo;
CREATE TABLE rename_demo (id integer,
       title text);
INSERT INTO rename_demo
VALUES (1,'Stone cup');
ALTER TABLE rename_demo RENAME COLUMN title TO label;
SELECT id,
       label
FROM rename_demo;
```
