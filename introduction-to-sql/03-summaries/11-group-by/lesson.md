---
title: Make one summary per group
slug: group-by
order: 11
language: sql
runtime: sql
lesson_type: interactive
summary: Make a separate summary for each category.
seo_title: Make one summary per group | Introduction to SQL
seo_description: Make a separate summary for each category.
seo_keywords:
- SQL
- PostgreSQL
- group by
sql:
  seed: seed.sql
---

# Make one summary per group

The market's overall total hides differences between stalls. `GROUP BY stall` partitions the selected rows by stall, then the aggregates run within each partition. The result now has one row per stall.

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

Every selected value must make sense at that new level. `stall` names the group; `SUM(amount)` summarizes it. A sale_id would not belong in the output unless we also grouped by it, which would change the question to individual sales.

Run the example. East and West both total 20, but they remain separate groups. `ORDER BY stall` controls display after grouping; GROUP BY itself does not guarantee any order.

Choose the grain of a result before writing a query. 'One row per category' means group by category. 'One row per category and availability' means group by both columns, producing a different report. NULL grouping values are collected together as a group.

```sql run
SELECT stall, COUNT(*) AS sales_count,
       SUM(amount) AS total
FROM sales
GROUP BY stall
ORDER BY stall;
```
