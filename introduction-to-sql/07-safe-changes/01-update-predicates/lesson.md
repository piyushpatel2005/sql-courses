---
title: Update the rows you intend
slug: update-predicates
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Correct one fee while leaving the other records untouched.
seo_title: Update the rows you intend | Introduction to SQL
seo_description: Correct one fee while leaving the other records untouched.
seo_keywords:
- SQL
- PostgreSQL
- update predicates
sql:
  seed: seed.sql
---

# Update the rows you intend

A cafe has corrected the price of Soup. `UPDATE menu SET price = 5.50 WHERE item_id = 2` changes that one row. The primary-key predicate identifies the target even if several items have the same display name. Without WHERE, UPDATE changes every row.

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

Before a real update, run a SELECT with the same WHERE clause to inspect the target. In a multi-user database, that preview alone cannot prevent another transaction from changing data between the two statements; transactions and appropriate locking are separate concerns.

An expression in SET can use the old value, such as `price = price + 1`. Several assignments are separated by commas. PostgreSQL's `RETURNING` can show changed rows directly, but the course uses a final SELECT when the goal is to verify the entire resulting table, including unchanged rows.

Run the cafe correction. Its absolute assignment is safe to repeat in this demo; an increment would apply again. Exercise Run and Submit rebuild the supplied fixture each time, so your exercise never accumulates earlier attempts.

```sql run
UPDATE menu SET price = 5.50 WHERE item_id = 2;
SELECT item_id, item, price FROM menu ORDER BY item_id;
```
