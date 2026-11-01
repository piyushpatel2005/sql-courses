---
title: Recognize missing values with IS NULL
slug: null-values
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Find missing notes without confusing NULL with an empty string.
seo_title: Recognize missing values with IS NULL | Introduction to SQL
seo_description: Find missing notes without confusing NULL with an empty string.
seo_keywords:
- SQL
- PostgreSQL
- null values
sql:
  seed: seed.sql
---

# Recognize missing values with IS NULL

The absence of a cafe note is stored as `NULL`. It is not an empty string, zero, or the word 'NULL'. It means there is no known value in that field. The application must decide whether that means unknown, unrecorded, or not applicable.

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

Ordinary comparisons with NULL produce unknown. Even `note = NULL` is not true for a missing note. WHERE keeps only true rows, so use `IS NULL` to find missing values and `IS NOT NULL` to find recorded ones.

This also affects negation. `NOT (note = 'urgent')` does not include missing notes, because NOT unknown is still unknown. If missing notes should count, write that rule explicitly with `OR note IS NULL`.

Run the example. Tea and Cake have no note. Their menu rows still exist; only one field is missing. Later, COALESCE will let us choose display text for these missing fields without pretending the source was complete.

```sql run
SELECT item
FROM menu
WHERE note IS NULL
ORDER BY item_id;
```
