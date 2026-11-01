---
title: Calculate a mean with AVG
slug: average-values
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate the mean of the catalog's known fees.
seo_title: Calculate a mean with AVG | Introduction to SQL
seo_description: Calculate the mean of the catalog's known fees.
seo_keywords:
- SQL
- PostgreSQL
- Calculate a mean with AVG
sql:
  seed: seed.sql
---

# Calculate a mean with AVG

AVG divides the sum of known values by their count. NULL inputs do not contribute to either side. A known zero does. A mean describes this chosen population; filtering the input first changes the question. PostgreSQL numeric inputs retain fractional results.

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

The sales result uses known amounts as its denominator. A missing amount would not act like a recorded zero.

```sql run
SELECT AVG(amount) AS average_sale
FROM sales;
```
