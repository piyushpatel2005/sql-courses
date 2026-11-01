---
title: Use a scalar subquery as a value
slug: subqueries
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Compare each fee with a mean computed by a scalar subquery.
seo_title: Use a scalar subquery as a value | Introduction to SQL
seo_description: Compare each fee with a mean computed by a scalar subquery.
seo_keywords:
- SQL
- PostgreSQL
- Use a scalar subquery as a value
sql:
  seed: seed.sql
---

# Use a scalar subquery as a value

We can filter a price against a fixed number and calculate an overall average, but those have been separate queries. To ask for above-average items without copying a benchmark by hand, put the average query inside the price comparison.

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

A scalar subquery returns one column and at most one row for a position expecting one value. The parenthesized AVG query supplies a computed benchmark for each outer comparison. Several rows would be an error; no rows would supply NULL.

The cafe compares each item's price with the mean across the whole menu. The inner query supplies 3.625; Soup at 5.00 and Cake at 4.00 exceed it, while Tea and Coffee do not. The parentheses enclose a complete SELECT, not a column list, and only the outer statement ends with a semicolon. Read the inner question first while learning, but do not assume that the planner must physically execute it in that order. Filtering the inner population differently would change the benchmark.

```sql run
SELECT item,price
FROM menu
WHERE price > (SELECT AVG(price)
FROM menu)
ORDER BY item_id;
```
