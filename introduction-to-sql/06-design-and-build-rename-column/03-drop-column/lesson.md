---
title: Remove one column with DROP COLUMN
slug: drop-column
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Remove a temporary field while keeping the rest of the table.
seo_title: Remove one column with DROP COLUMN | Introduction to SQL
seo_description: Remove a temporary field while keeping the rest of the table.
seo_keywords:
- SQL
- PostgreSQL
- Remove one column with DROP COLUMN
sql:
  seed: seed.sql
---

# Remove one column with DROP COLUMN

ALTER TABLE ... DROP COLUMN removes a field and the values stored in it while keeping other columns and rows. This loses data. Inspect dependencies and preserve important information before changing a real schema.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `labels`

One row represents one museum label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label_id` · `integer` | Identifier of the label record. | Nullable; `NULL` means the identifier is unrecorded. |
| `title` · `text` | Title printed on the museum label. | Nullable; `NULL` means no title value is recorded. |
| `scratch_note` · `text` | Temporary review note that this lesson removes. | Nullable; `NULL` means no scratch note value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### After the schema change

The following is the resulting shape. The starting dictionary above describes what is available before the change.

#### `labels`

One row represents one museum label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label_id` · `integer` | Identifier of the label record. | Nullable; `NULL` means the identifier is unrecorded. |
| `title` · `text` | Title printed on the museum label. | Nullable; `NULL` means no title value is recorded. |

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

### State for this lesson

After the change, `scratch_note` no longer exists. The remaining `label_id` is still nullable and is not a primary key in this particular fixture.

The museum no longer needs its temporary review note. IF EXISTS makes the demonstration safe to repeat after the column is gone. A final SELECT shows that the identifier and title still exist.

```sql run
ALTER TABLE labels DROP COLUMN IF EXISTS scratch_note;
SELECT label_id,
       title
FROM labels;
```
