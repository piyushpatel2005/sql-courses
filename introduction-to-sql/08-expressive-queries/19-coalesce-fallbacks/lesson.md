---
title: Display a fallback with COALESCE
slug: coalesce-fallbacks
order: 19
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label for missing notes without changing the source.
seo_title: Display a fallback with COALESCE | Introduction to SQL
seo_description: Display a label for missing notes without changing the source.
seo_keywords:
- SQL
- PostgreSQL
- Display a fallback with COALESCE
sql:
  seed: seed.sql
---

# Display a fallback with COALESCE

COALESCE returns the first non-NULL argument. It lets a report display a helpful label when a value is missing without changing the stored source. An empty string is not NULL and therefore does not invoke the fallback.

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

The cafe uses No note for missing handling notes. Existing notes remain visible. Choose a fallback that means what the source supports: substituting zero for unknown money would change a metric rather than simply improve its label. Arguments must have compatible types.

```sql run
SELECT item,
       COALESCE(note,
       'No note') AS display_note
FROM menu
ORDER BY item_id;
```
