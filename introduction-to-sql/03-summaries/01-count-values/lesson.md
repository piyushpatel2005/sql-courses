---
title: Count rows and known values with COUNT
slug: count-values
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Distinguish the number of rows from the number of known notes.
seo_title: Count rows and known values with COUNT | Introduction to SQL
seo_description: Distinguish the number of rows from the number of known notes.
seo_keywords:
- SQL
- PostgreSQL
- Count rows and known values with COUNT
sql:
  seed: seed.sql
---

# Count rows and known values with COUNT

The last section returned individual items, even when we limited the list. A market organizer now needs a summary instead: how many sales were recorded, and how many used a voucher?

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `sales`

One row represents one recorded market sale.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `sale_id` · `integer` | Identifier of the sale. | Primary key. Required; cannot be `NULL`. |
| `stall` · `text` | Stall label used to group the sales. | Nullable; `NULL` means no stall value is recorded. |
| `amount` · `numeric(8,2)` | Value of this sale in currency units, stored to two decimal places. | Nullable; `NULL` means the sale amount is unrecorded. |
| `voucher` · `text` | Optional voucher code recorded with the sale. | Nullable; `NULL` means no voucher code is recorded. |

`NULL` in `voucher` means no voucher code is recorded; it is not a missing sale. Missing `amount` means an unrecorded amount, not zero. Stall names and voucher codes are not unique keys; no currency code or nonnegative-amount constraint is declared.

There are five sale rows; only two contain a voucher code. These are different data from the lending catalog in the exercise.

COUNT(*) counts rows. COUNT(column) counts only non-NULL values in that column. Their difference measures missingness, not missing rows. An aggregate without GROUP BY produces one summary row. On empty input both counts are zero.

Compare the two counts in the sales result. A sale without a voucher is still a sale.

An aggregate is a function that combines values from several input rows. Its parentheses contain the input: `COUNT(voucher)` examines that column, while the special `COUNT(*)` form counts rows. The comma separates the two output expressions, and `AS` gives each count its own heading. You can omit `ORDER BY` here because there is only one result row.

```sql run
SELECT COUNT(*) AS sales_count,
       COUNT(voucher) AS with_voucher
FROM sales;
```
