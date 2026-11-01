---
title: Name a result column with AS
slug: column-aliases
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Give a result column a useful heading with AS.
seo_title: Name a result column with AS | Introduction to SQL
seo_description: Give a result column a useful heading with AS.
seo_keywords:
- SQL
- PostgreSQL
- Name a result column with AS
sql:
  seed: seed.sql
---

# Name a result column with AS

The cafe prints prices under a heading its customers recognize. `AS` gives a selected expression an output name; it does not rename the stored column. Write the source column first, then AS and the new heading. Other clauses can still refer to the source column.

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

Run the query and compare the heading with the table definition. The values have not changed. In the exercise, choose a different heading for a lending fee.

```sql run
SELECT item,
       price AS menu_price
FROM menu
ORDER BY item_id;
```
