---
title: Keep detail rows while calculating a rank
slug: window-functions
order: 9
language: sql
runtime: sql
lesson_type: interactive
summary: Number detail rows separately within each category.
seo_title: Keep detail rows while calculating a rank | Introduction to SQL
seo_description: Number detail rows separately within each category.
seo_keywords:
- SQL
- PostgreSQL
- window functions
sql:
  seed: seed.sql
---

# Keep detail rows while calculating a rank

GROUP BY collapses input rows into summaries. A window function can calculate across related rows while leaving each detail row in the result. `ROW_NUMBER() OVER (...)` assigns a sequence number within the described window.

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

The empty parentheses in `ROW_NUMBER()` mean this function takes no ordinary value argument. `OVER` has its own parentheses describing which rows belong together and how to order them for numbering. `PARTITION BY stall` is not `GROUP BY stall`: East still contributes both sale rows, rather than one total. The alias `position` names the new output column.

PARTITION BY starts a separate numbering sequence for each stall. ORDER BY inside OVER decides the numbering order; the final ORDER BY decides how the finished result is displayed. These are different responsibilities. A sale_id tie-breaker makes equal amounts deterministic.

Run the market example. Every sale remains visible, but you can identify the largest one in each stall by position 1. ROW_NUMBER gives distinct positions within each partition. The following lessons teach shared ranks separately.

This lesson uses the partition and ordering clauses only to assign positions. Running and rolling aggregate frames belong to a later analysis workflow.

```sql run
SELECT stall, sale_id, amount,
       ROW_NUMBER() OVER (
         PARTITION BY stall
         ORDER BY amount DESC, sale_id
       ) AS position
FROM sales
ORDER BY stall, position;
```
