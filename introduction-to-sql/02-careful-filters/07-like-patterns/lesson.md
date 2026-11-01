---
title: Find text with LIKE
slug: like-patterns
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Find a text pattern rather than a fixed list of names.
seo_title: Find text with LIKE | Introduction to SQL
seo_description: Find a text pattern rather than a fixed list of names.
seo_keywords:
- SQL
- PostgreSQL
- like patterns
sql:
  seed: seed.sql
---

# Find text with LIKE

A text search need not require an exact word. `LIKE 'C%'` means the value begins with uppercase C and then has zero or more characters. `%` is the multi-character wildcard; `_` matches exactly one character. The pattern applies to the whole value, so `'%C%'` instead looks anywhere within it.

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

Run the cafe search. Cake and Coffee qualify. Plain LIKE is case-sensitive for these ordinary PostgreSQL text values. PostgreSQL also offers `ILIKE` for case-insensitive matching; other databases often use a different collation or function strategy, so do not assume ILIKE is portable.

A literal percent sign needs escaping rather than acting as a wildcard. For example, `LIKE '%!%%' ESCAPE '!'` searches for a percent sign anywhere. We use the explicit escape character to keep that meaning visible.

The exercise searches for a space, not a particular gear name. Put `%` on both sides so the space can occur anywhere.

```sql run
SELECT item
FROM menu
WHERE item LIKE 'C%'
ORDER BY item_id;
```
