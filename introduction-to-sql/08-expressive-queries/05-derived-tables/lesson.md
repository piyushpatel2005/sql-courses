---
title: Read a subquery as a table
slug: derived-tables
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Query a grouped result as an intermediate table.
seo_title: Read a subquery as a table | Introduction to SQL
seo_description: Query a grouped result as an intermediate table.
seo_keywords:
- SQL
- PostgreSQL
- Read a subquery as a table
sql:
  seed: seed.sql
---

# Read a subquery as a table

A parenthesized query in FROM supplies an intermediate table for one statement. Give it an alias and refer to its selected columns from the outer query. This is often called a derived table.

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

### Named query result

#### `totals`

One row represents one section group.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `section` · `text` | Grouping label from `menu.section`. | Logical group key, not a physical primary key. A NULL section forms one group. |
| `total` · `numeric` | Sum of `menu.price` in this group, in currency units. | Computed value; no fixed precision or scale. NULL if the group has no known prices; NULL prices are ignored, not replaced with zero. |

This FROM-subquery alias exists only within the statement. Grouping yields one row per label, including at most one NULL-label group where allowed; it creates no stored table, key or foreign key.

The cafe first summarizes each section, then filters the summary as ordinary rows. The intermediate grain is one row per section. Keep the inner and outer parentheses clear; the alias names the result, not a persistent database object.

The inner SELECT creates columns named `section` and `total`. From the outer query's point of view, `total` is now an input column, so `WHERE total >= 5` is valid. That differs from using a same-level SELECT alias in WHERE or HAVING. You could express this particular report with HAVING too; the derived table practices separating a summary from the query that reads it.

```sql run
SELECT section,total
FROM (SELECT section,SUM(price) AS total
FROM menu
GROUP BY section) AS totals
WHERE total >= 5
ORDER BY section;
```
