---
title: Reverse a known condition with NOT
slug: not-conditions
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Find the rows that fail a known boolean condition.
seo_title: Reverse a known condition with NOT | Introduction to SQL
seo_description: Find the rows that fail a known boolean condition.
seo_keywords:
- SQL
- PostgreSQL
- Reverse a known condition with NOT
sql:
  seed: seed.sql
---

# Reverse a known condition with NOT

NOT reverses true and false. It is useful when the requested population is the opposite of a familiar condition. The cafe is checking items that are not currently in stock.

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

Parentheses make the condition being reversed clear. NOT applies before AND and OR, so explicit grouping helps when a condition grows. A missing value does not become known simply because you negate a comparison; the next section explains that NULL behavior. All stock values in this cafe dataset are known, although its table definition permits missing values. The exercise's `gear.available` column also has a `NOT NULL` rule, which prevents missing availability values.

```sql run
SELECT item
FROM menu
WHERE NOT (in_stock = true)
ORDER BY item_id;
```
