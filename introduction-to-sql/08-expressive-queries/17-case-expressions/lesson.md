---
title: Choose a value with CASE
slug: case-expressions
order: 17
language: sql
lesson_type: interactive
runtime: sql
summary: Turn an availability condition into a readable status.
seo_title: Choose a value with CASE | Introduction to SQL
seo_description: Turn an availability condition into a readable status.
seo_keywords:
- SQL
- PostgreSQL
- Choose a value with CASE
sql:
  seed: seed.sql
---

# Choose a value with CASE

CASE checks WHEN conditions in order and returns the THEN value for the first true condition. ELSE supplies a fallback; without it an unmatched row gets NULL. END closes the expression.

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

The cafe converts a stored availability flag into a readable label without changing that flag. Put narrower rules before broader ones so an early condition does not swallow later cases. The result branches must have compatible types. Run the labels and compare them with the source booleans.

```sql run
SELECT item,
       CASE WHEN in_stock THEN 'ready' ELSE 'sold out' END AS status
FROM menu
ORDER BY item_id;
```
