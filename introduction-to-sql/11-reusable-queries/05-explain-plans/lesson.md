---
title: Read a query plan with EXPLAIN
slug: explain-plans
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Inspect the proposed operations for a query.
seo_title: Read a query plan with EXPLAIN | Introduction to SQL
seo_description: Inspect the proposed operations for a query.
seo_keywords:
- SQL
- PostgreSQL
- Read a query plan with EXPLAIN
sql:
  seed: seed.sql
---

# Read a query plan with EXPLAIN

EXPLAIN shows proposed operations without executing an ordinary SELECT. EXPLAIN (COSTS OFF) hides cost estimates so this example focuses on the work. A Seq Scan reads the table and filters rows; an Index Scan uses an index to locate candidates.

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

Tiny tables can favor a sequential scan even with an index. Costs are estimates, not milliseconds. EXPLAIN ANALYZE does execute the statement, so do not add ANALYZE casually to writes. Run this plan, identify its filter, and treat its operation choice as specific to this fixture.

```sql run
EXPLAIN (COSTS OFF) SELECT item
FROM menu
WHERE section = 'drink';
```
