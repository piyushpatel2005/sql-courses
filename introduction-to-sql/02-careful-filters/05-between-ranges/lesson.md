---
title: Select an inclusive range with BETWEEN
slug: between-ranges
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Select a numeric range that includes both endpoints.
seo_title: Select an inclusive range with BETWEEN | Introduction to SQL
seo_description: Select a numeric range that includes both endpoints.
seo_keywords:
- SQL
- PostgreSQL
- Select an inclusive range with BETWEEN
sql:
  seed: seed.sql
---

# Select an inclusive range with BETWEEN

BETWEEN selects values from a lower bound through an upper bound, including both endpoints. The AND inside `price BETWEEN 3 AND 5` is part of the range syntax. It is equivalent here to price >= 3 AND price <= 5.

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

Run the cafe query and look for values exactly at a boundary. A timestamp range has a separate complication: an inclusive midnight endpoint does not include the rest of that date. Later date lessons use an exclusive next-period boundary for whole days and months. This lesson uses plain numeric prices.

```sql run
SELECT item,
       price
FROM menu
WHERE price BETWEEN 3 AND 5
ORDER BY item_id;
```
