---
title: Share a business rank across ties
slug: rank-ties
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Give tied fees the same rank and leave a gap afterward.
seo_title: Share a business rank across ties | Introduction to SQL
seo_description: Give tied fees the same rank and leave a gap afterward.
seo_keywords:
- SQL
- PostgreSQL
- Share a business rank across ties
sql:
  seed: seed.sql
---

# Share a business rank across ties

RANK assigns the same rank to peers and leaves a gap after them. The peer rule is determined by the expressions inside the window ORDER BY. Keep a display identifier outside that ordering when tied values should remain peers.

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

ROW_NUMBER gave every sale a different position, even for equal amounts. A shared business rank asks a different question. This lesson adds sale 6, another East sale of 12, so there are now six sale rows. The exercise likewise adds a Socket set costing 6.00 in repair, alongside the Saw. These extra rows make a tie followed by a lower value visible inside one partition; equal prices in different categories would not demonstrate a shared rank.

The market ranks sale amounts within each stall. Every detail row remains visible, unlike a grouped aggregate. The two East sales of 12 share rank 1; its sale of 8 follows at rank 3.

```sql run
SELECT stall,sale_id,amount,RANK() OVER (PARTITION BY stall
ORDER BY amount DESC) AS rank
FROM sales
ORDER BY stall,amount DESC,sale_id;
```
