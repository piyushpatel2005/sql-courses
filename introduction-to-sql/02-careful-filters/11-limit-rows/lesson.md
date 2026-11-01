---
title: Take a bounded result with LIMIT
slug: limit-rows
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Choose a fixed number of rows from a deliberate ordering.
seo_title: Take a bounded result with LIMIT | Introduction to SQL
seo_description: Choose a fixed number of rows from a deliberate ordering.
seo_keywords:
- SQL
- PostgreSQL
- Take a bounded result with LIMIT
sql:
  seed: seed.sql
---

# Take a bounded result with LIMIT

LIMIT takes a maximum number of rows from the query result. Use the ordering rule from the previous lesson to decide which rows are kept. Without ORDER BY, a limit means an arbitrary subset, not the first records inserted.

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

The cafe displays only its two highest prices. Sorting happens before the limit in the query's logical meaning. In the exercise, a tied fee sits at the cutoff, so the identifier tie-breaker decides which item remains.

```sql run
SELECT item,
       price
FROM menu
ORDER BY price DESC,
       item_id LIMIT 2;
```
