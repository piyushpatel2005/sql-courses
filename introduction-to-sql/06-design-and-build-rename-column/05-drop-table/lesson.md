---
title: Remove a table with DROP TABLE
slug: drop-table
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Remove an obsolete table without removing the live catalog.
seo_title: Remove a table with DROP TABLE | Introduction to SQL
seo_description: Remove an obsolete table without removing the live catalog.
seo_keywords:
- SQL
- PostgreSQL
- Remove a table with DROP TABLE
sql:
  seed: seed.sql
---

# Remove a table with DROP TABLE

DROP TABLE removes the whole table, including its rows and definition. It is not the same as deleting selected rows or dropping one field. IF EXISTS avoids an error when the table is already absent.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `current_labels`

One row represents one current label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label` · `text` | Label text in the live catalog. | Nullable; `NULL` means no label value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

#### `old_import`

One row represents one obsolete imported label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label` · `text` | Imported label text. | Nullable; `NULL` means no label value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### State for this lesson

`old_import` is the removal target. `current_labels` is a separate live table; there is no declared relationship between them.

The demo removes an obsolete import table and then reads the separate live catalog. Dependencies can prevent a drop. Do not add CASCADE just to silence that error: it may remove objects you still need. The final result checker cannot independently establish that a table was dropped.

```sql run
DROP TABLE IF EXISTS old_import;
SELECT label
FROM current_labels
ORDER BY label;
```
