---
title: Sort rows with an explicit tie-breaker
slug: order-by
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Sort rows predictably when values tie.
seo_title: Sort rows with an explicit tie-breaker | Introduction to SQL
seo_description: Sort rows predictably when values tie.
seo_keywords:
- SQL
- PostgreSQL
- Sort rows with an explicit tie-breaker
sql:
  seed: seed.sql
---

# Sort rows with an explicit tie-breaker

ORDER BY determines the display order. ASC is ascending and is the default; DESC reverses it. A second expression resolves ties in the first.

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

The cafe sorts expensive items first and uses item_id for any tied price. Without a final unique tie-breaker, equally priced items can appear in either order. PostgreSQL also supports NULLS FIRST and NULLS LAST to choose where missing sort values appear. Run the list and check both its first price and its final price.

```sql run
SELECT item,
       price
FROM menu
ORDER BY price DESC,
       item_id;
```
