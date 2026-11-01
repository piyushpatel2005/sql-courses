---
title: Create an index without changing a result
slug: create-index
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Declare an index while preserving the meaning of a lookup.
seo_title: Create an index without changing a result | Introduction to SQL
seo_description: Declare an index while preserving the meaning of a lookup.
seo_keywords:
- SQL
- PostgreSQL
- Create an index without changing a result
sql:
  seed: seed.sql
---

# Create an index without changing a result

An index is an additional structure that can help PostgreSQL locate rows. CREATE INDEX ... ON table(column) creates a common B-tree index. It costs storage and write maintenance, so adding indexes everywhere is not a good default. Primary and unique keys already have supporting indexes.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `menu`

One row represents one cafe menu item.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `item_id` · `integer` | Identifier of the menu item. | Primary key. Required; cannot be `NULL`. |
| `item` · `text` | Item display name, not an identifier. | Nullable; `NULL` means no item value is recorded. |
| `section` · `text` | Menu grouping, such as food or drink. | Nullable; `NULL` means no section value is recorded. |
| `price` · `numeric(6,2)` | Price of one item in currency units, stored to two decimal places. | Nullable; `NULL` means the price is unrecorded, not zero. |
| `in_stock` · `boolean` | Availability flag: true means in stock; false means not in stock. | Nullable; `NULL` means availability is unrecorded. |
| `note` · `text` | Optional item or handling note. | Nullable; `NULL` means no note is recorded. |

Only `item_id` is required by this schema. A missing stock flag means availability is unrecorded, not false. The sample section labels are not an enforced list; no currency code or nonnegative-price rule is declared.

The cafe creates a section index and runs its usual lookup. Its rows and order must not change. IF NOT EXISTS makes this demo repeatable. Submit checks the result, not whether the index exists or makes the query faster; inspect the declaration as well.

```sql run
CREATE INDEX IF NOT EXISTS menu_section_idx ON menu(section);
SELECT item
FROM menu
WHERE section = 'drink'
ORDER BY item_id;
```
