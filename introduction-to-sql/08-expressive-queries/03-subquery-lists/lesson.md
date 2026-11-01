---
title: Use a subquery as an IN list
slug: subquery-lists
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Select categories through a one-column subquery.
seo_title: Use a subquery as an IN list | Introduction to SQL
seo_description: Select categories through a one-column subquery.
seo_keywords:
- SQL
- PostgreSQL
- Use a subquery as an IN list
sql:
  seed: seed.sql
---

# Use a subquery as an IN list

IN can read the values returned by a one-column subquery instead of a literal list. It asks whether the outer value occurs anywhere in that result. Repeated inner values do not create extra outer rows.

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

Here the subquery selects the cafe sections containing a cheap item, and the outer query lists every item in those sections. The question differs from directly filtering the outer price. Keep NULL behavior in mind before turning IN into NOT IN.

```sql run
SELECT item,section
FROM menu
WHERE section IN (SELECT section
FROM menu
WHERE price < 3)
ORDER BY item_id;
```
