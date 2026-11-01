---
title: Require both conditions with AND
slug: and-conditions
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Require availability and a price condition together.
seo_title: Require both conditions with AND | Introduction to SQL
seo_description: Require availability and a price condition together.
seo_keywords:
- SQL
- PostgreSQL
- Require both conditions with AND
sql:
  seed: seed.sql
---

# Require both conditions with AND

An affordable item is not useful to a customer if it is sold out. AND requires both conditions to be true. PostgreSQL boolean columns hold true or false (and NULL if allowed); these keywords are not quoted text.

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

The previous filter asked only about price. Now each row must pass two tests: its stock value must be true, and its price must be below 4. Write a complete comparison on each side of `AND`; `in_stock = true AND price < 4` combines their answers.

Here the price rule and stock rule both apply to every row. Run the query, then inspect an unavailable item and an expensive item to see why each is excluded. The exercise uses the same intersection of requirements on lending data.

```sql run
SELECT item,
       price
FROM menu
WHERE in_stock = true AND price < 4
ORDER BY item_id;
```
