---
title: Count distinct ranked levels
slug: dense-rank-ties
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Number distinct fee levels without gaps after ties.
seo_title: Count distinct ranked levels | Introduction to SQL
seo_description: Number distinct fee levels without gaps after ties.
seo_keywords:
- SQL
- PostgreSQL
- Count distinct ranked levels
sql:
  seed: seed.sql
---

# Count distinct ranked levels

DENSE_RANK assigns the same rank to peers without leaving gaps. The peer rule is determined by the expressions inside the window ORDER BY. Keep a display identifier outside that ordering when tied values should remain peers.

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

This fixture has six sales, including the additional East sale of 12. Equal amounts are allowed; they do not conflict with the sale identifier key.

Keep the same six-sale dataset from the RANK lesson, including East's extra sale of 12. We are changing the numbering rule, not the population. RANK answers a competition-place question, while DENSE_RANK counts distinct amount levels: after the tied highest level, the next lower level is 2. The exercise retains the same six gear rows, including the Socket set, for that comparison.

The market ranks sale amounts within each stall. Every detail row remains visible, unlike a grouped aggregate. The two East sales of 12 share level 1. Its sale of 8 now follows at level 2, unlike the gap left by RANK.

```sql run
SELECT stall,sale_id,amount,DENSE_RANK() OVER (PARTITION BY stall
ORDER BY amount DESC) AS rank
FROM sales
ORDER BY stall,amount DESC,sale_id;
```
