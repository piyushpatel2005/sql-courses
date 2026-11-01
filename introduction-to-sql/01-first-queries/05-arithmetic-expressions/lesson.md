---
title: Calculate a result with arithmetic
slug: arithmetic-expressions
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate a quote from a stored daily price.
seo_title: Calculate a result with arithmetic | Introduction to SQL
seo_description: Calculate a quote from a stored daily price.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a result with arithmetic
sql:
  seed: seed.sql
---

# Calculate a result with arithmetic

A price for two items can be calculated without changing either item's stored price. An expression such as `price * 2` is evaluated for each row. Use the alias syntax from the previous lesson to name the answer.

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

SQL supports +, -, *, and /. Parentheses control grouping: `(price + 1) * 2` includes the extra amount twice. Integer division discards a fractional part in PostgreSQL; a decimal operand such as `5.0 / 2` keeps it. Run the quote and check Tea against its original price.

```sql run
SELECT item,
       price * 2 AS pair_price
FROM menu
ORDER BY item_id;
```
