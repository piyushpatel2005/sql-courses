---
title: Accept either condition with OR
slug: or-conditions
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Accept either category while keeping an availability requirement.
seo_title: Accept either condition with OR | Introduction to SQL
seo_description: Accept either category while keeping an availability requirement.
seo_keywords:
- SQL
- PostgreSQL
- Accept either condition with OR
sql:
  seed: seed.sql
---

# Accept either condition with OR

OR keeps a row when either condition is true. It does not create two copies when both conditions match. The cafe query accepts items that are cheap or belong to the food section.

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

When combining OR with an already learned AND condition, use parentheses for the alternatives. `in_stock AND (section = 'food' OR section = 'drink')` applies stock availability to both sections. AND binds more tightly than OR without those parentheses. Read the grouped condition aloud before relying on its output.

```sql run
SELECT item
FROM menu
WHERE price < 3 OR section = 'food'
ORDER BY item_id;
```
