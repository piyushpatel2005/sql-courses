---
title: Undo a later part with SAVEPOINT
slug: savepoints
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Keep an earlier correction while undoing a later trial.
seo_title: Undo a later part with SAVEPOINT | Introduction to SQL
seo_description: Keep an earlier correction while undoing a later trial.
seo_keywords:
- SQL
- PostgreSQL
- savepoints
sql:
  seed: seed.sql
---

# Undo a later part with SAVEPOINT

A transaction may contain a sound first change and an unwanted later change. SAVEPOINT names a position inside the open transaction. ROLLBACK TO that name discards work after it while preserving earlier work. COMMIT then accepts what remains.

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

The cafe first corrects Soup to 5.50. It then tries an excessive Tea price, decides against that trial, and rolls back to `price_checked`. The final menu retains the Soup correction and the original Tea price. The savepoint is not a partial commit: none of the transaction has committed until COMMIT.

`RELEASE SAVEPOINT name` removes a savepoint when it is no longer needed; it also does not commit the transaction. A full ROLLBACK would discard both changes. This difference is worth reading carefully in the SQL below.

After a statement error, PostgreSQL can leave a transaction aborted until rollback. The lesson runner stops at the first SQL error, so these demos use deliberate valid trials followed by rollback rather than pretending you can continue past a failing statement in one Run.


![Rollback to the savepoint discards the Tea trial while commit retains the earlier Soup correction.](savepoint-boundary.svg)

```sql run
BEGIN;
UPDATE menu SET price = 5.50 WHERE item_id = 2;
SAVEPOINT price_checked;
UPDATE menu SET price = 99 WHERE item_id = 1;
ROLLBACK TO price_checked;
COMMIT;
SELECT item_id, price FROM menu ORDER BY item_id;
```
