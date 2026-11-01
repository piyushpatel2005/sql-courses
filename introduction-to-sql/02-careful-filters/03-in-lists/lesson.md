---
title: Match an allowed list with IN
slug: in-lists
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Match a column against an explicit list of allowed values.
seo_title: Match an allowed list with IN | Introduction to SQL
seo_description: Match a column against an explicit list of allowed values.
seo_keywords:
- SQL
- PostgreSQL
- Match an allowed list with IN
sql:
  seed: seed.sql
---

# Match an allowed list with IN

IN compares one value with a list of allowed values. It is a compact way to express several equality alternatives: `section IN ('food', 'drink')` accepts either section. The list is enclosed in parentheses and its values are comma-separated.

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

The cafe example chooses named items rather than a price range. Adding the same name twice to the list would not duplicate a result row. Keep this list to known values: a NULL inside NOT IN can make an absence test unknown. We will use NOT EXISTS for missing related rows later.

```sql run
SELECT item,
       price
FROM menu
WHERE item IN ('Tea',
       'Soup')
ORDER BY item_id;
```
