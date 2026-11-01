---
title: Add known values with SUM
slug: sum-values
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Add known fees into one catalog total.
seo_title: Add known values with SUM | Introduction to SQL
seo_description: Add known fees into one catalog total.
seo_keywords:
- SQL
- PostgreSQL
- Add known values with SUM
sql:
  seed: seed.sql
---

# Add known values with SUM

SUM adds the non-NULL values in a column. It does not add a missing value as zero. With no known inputs, SUM returns NULL. Keep units in mind: adding per-item fees describes the cost of borrowing one of each item, not the number of items.

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

The sales result has one total, not one row per stall. Every known amount contributes once.

```sql run
SELECT SUM(amount) AS total
FROM sales;
```
