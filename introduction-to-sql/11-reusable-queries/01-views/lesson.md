---
title: Name a reusable query with a view
slug: views
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Give a recurring filter a reusable query name.
seo_title: Name a reusable query with a view | Introduction to SQL
seo_description: Give a recurring filter a reusable query name.
seo_keywords:
- SQL
- PostgreSQL
- views
sql:
  seed: seed.sql
---

# Name a reusable query with a view

A view is a stored query definition that can be selected like a table. The cafe often needs its in-stock menu, so `CREATE VIEW` gives that filter a name. Selecting the view runs its definition against the underlying data; an ordinary view is not a separate stored snapshot.

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

#### `ready_menu`

One row represents one in-stock menu item.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `item_id` · `integer` | Identifier inherited from `menu.item_id`. | Logically unique and non-NULL because the base primary key passes through unchanged; not a declared view primary key. |
| `item` · `text` | Display name inherited from `menu.item`. | Inherited nullable value; no view uniqueness constraint. |
| `price` · `numeric(6,2)` | Item price inherited from `menu.price`, in currency units. | Inherited nullable value; two decimal places. |

This is the view you are about to create, not a preloaded table. Its fields come directly from `menu`; the availability filter does not aggregate or duplicate rows. The view has no separately declared physical key or foreign key, and its rows reflect current base data rather than a frozen snapshot.

Run the demo. `CREATE OR REPLACE VIEW` allows repeated runs with this compatible definition. The final SELECT names the output order explicitly. Do not depend on a view definition's internal order when the outer query needs a stable report.

A view can simplify repeated SQL and expose selected columns, but security depends on its permissions and definition, not merely on its name. A materialized view is a different object that stores results and needs refreshing; we do not create one here.

When designing a view, choose a clear grain and stable column names. A narrow view that answers one recurring question is easier to use than a hidden maze of nested definitions. The exercise view has one row per available gear item.

```sql run
CREATE OR REPLACE VIEW ready_menu AS
SELECT item_id, item, price
FROM menu WHERE in_stock = true;
SELECT item, price FROM ready_menu ORDER BY item_id;
```
