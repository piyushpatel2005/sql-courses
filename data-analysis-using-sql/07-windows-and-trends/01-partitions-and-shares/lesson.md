---
title: Keep detail rows while computing group shares
slug: partitions-and-shares
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Keep individual orders beside their member's total and share.
seo_title: Keep detail rows while computing group shares | Data Analysis Using SQL
seo_description: Keep individual orders beside their member's total and share.
seo_keywords:
- SQL analysis
- partitions and shares
- PostgreSQL
sql:
  seed: seed.sql
---

# Keep detail rows while computing group shares

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `item_sales`

One row represents one prepared item-sales summary.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `item` · `text` | Item label; unique in the sample but not a declared key. | Nullable; `NULL` means no item value is recorded. |
| `category` · `text` | Sales category used as the window partition. | Nullable; `NULL` means no category value is recorded. |
| `revenue` · `numeric` | Item revenue in a common currency; the fixture does not name that currency. | Nullable; `NULL` means the revenue measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

Every field remains available to the full-category window, not only to the displayed item share. There is no declared uniqueness or nonnegative-revenue rule.

A window function can put a group total beside each detail row without collapsing the details. That makes a percent-of-total report easier to inspect.

An aggregate with `OVER (...)` becomes a window calculation. `PARTITION BY` defines which rows share a total. Without an `ORDER BY` inside the window, `SUM(value) OVER (PARTITION BY key)` uses the whole partition. It preserves one output row per input row.

An empty `OVER ()` omits both partitioning and ordering, so all rows left in the query form one partition. For example, `SUM(revenue) OVER ()` would put the whole stall's total beside each item, rather than its category total. We will use this spelling when a later report needs an all-region denominator.

The window sees the rows remaining after WHERE, grouping, and HAVING. A filter can therefore change the denominator. If you want to display only some rows but keep an all-row denominator, calculate the window in a CTE first and filter outside it. The final `ORDER BY` controls display order, independently of the ordering within a window.

## Read and run

A food stall shows each item's share of its category sales. This separate `item_sales` fixture already has one summary row per item: `item` and `category` are text, and `revenue` is numeric money in a common currency. It has no declared key constraint; the supplied item labels are unique. We keep that item grain while adding the category denominator.

```sql run
SELECT item, category, revenue,
       SUM(revenue) OVER (PARTITION BY category)
         AS category_total,
       ROUND(100.0 * revenue / NULLIF(
         SUM(revenue) OVER (PARTITION BY category), 0
       ), 2) AS share_pct
FROM item_sales
ORDER BY category, item;
```

Bun and pie keep separate rows but use the same baked-goods denominator. Tea has 100% of its own category, not 100% of the stall total.

Filtering out pie before the window would shrink the baked-goods denominator. Calculate the total first if pie should be hidden but still contribute.
