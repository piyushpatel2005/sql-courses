---
title: Remove duplicate result rows
slug: distinct
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Build a category list without repeated result rows.
seo_title: Remove duplicate result rows | Introduction to SQL
seo_description: Build a category list without repeated result rows.
seo_keywords:
- SQL
- PostgreSQL
- distinct
sql:
  seed: seed.sql
---

# Remove duplicate result rows

The cafe sells several food items, but its navigation menu needs each section only once. `DISTINCT` removes duplicate rows from the selected result. It does not delete duplicates from the source table.

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

The word appears directly after `SELECT`. With one selected column, duplicate means the same value in that column. With two selected columns, SQL compares the whole pair. Selecting `section, item` would preserve both Soup and Cake because those pairs differ.

Run the example and look for two rows, `drink` and `food`. Sorting by the selected section makes their display predictable. Do not use DISTINCT just to hide unexpected duplicates after a join; first understand why the join produced those rows. We will return to that distinction when tables are combined.

```sql run
SELECT DISTINCT section
FROM menu
ORDER BY section;
```
