---
title: Find a maximum with MAX
slug: maximum-value
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Find the largest known fee in the catalog.
seo_title: Find a maximum with MAX | Introduction to SQL
seo_description: Find the largest known fee in the catalog.
seo_keywords:
- SQL
- PostgreSQL
- Find a maximum with MAX
sql:
  seed: seed.sql
---

# Find a maximum with MAX

MAX returns the largest known value, not the identity of the row containing it. An ungrouped maximum has one output row even when several inputs tie. NULLs are ignored and an empty collection returns NULL.

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

The result shows an amount, not the stall that earned it. Tied maxima would still produce one summary value.

```sql run
SELECT MAX(amount) AS largest_sale
FROM sales;
```
