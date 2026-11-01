---
title: Filter rows with WHERE
slug: where-filters
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Keep only rows that satisfy a comparison.
seo_title: Filter rows with WHERE | Introduction to SQL
seo_description: Keep only rows that satisfy a comparison.
seo_keywords:
- SQL
- PostgreSQL
- Filter rows with WHERE
sql:
  seed: seed.sql
---

# Filter rows with WHERE

The cafe wants a short list of inexpensive items. WHERE tests a condition on each source row and keeps only true results. Put it after FROM and before ORDER BY.

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

Comparisons include =, <> (not equal), <, <=, >, and >=. Text constants use single quotes, while numbers do not. The example includes only prices strictly below 4; changing < to <= would include an item priced exactly 4. A SELECT alias is not available in WHERE, so use the source column or repeat its calculation.

```sql run
SELECT item,
       price
FROM menu
WHERE price < 4
ORDER BY item_id;
```
