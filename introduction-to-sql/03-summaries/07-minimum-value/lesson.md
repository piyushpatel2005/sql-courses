---
title: Find a minimum with MIN
slug: minimum-value
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Find the smallest known fee without selecting an arbitrary item.
seo_title: Find a minimum with MIN | Introduction to SQL
seo_description: Find the smallest known fee without selecting an arbitrary item.
seo_keywords:
- SQL
- PostgreSQL
- Find a minimum with MIN
sql:
  seed: seed.sql
---

# Find a minimum with MIN

MIN returns the smallest known value. It does not return the whole row that contains that value, and tied minima still produce one summary value. NULLs are ignored; an empty collection has no known minimum.

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

The result shows the smallest amount without a sale identifier. An identifier would require a separate row-selection question.

```sql run
SELECT MIN(amount) AS smallest_sale
FROM sales;
```
