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

A window function can put a group total beside each detail row without collapsing the details. That makes a percent-of-total report easier to inspect.

An aggregate with `OVER (...)` becomes a window calculation. `PARTITION BY` defines which rows share a total. Without an `ORDER BY` inside the window, `SUM(value) OVER (PARTITION BY key)` uses the whole partition. It preserves one output row per input row.

The window sees the rows remaining after WHERE, grouping, and HAVING. A filter can therefore change the denominator. If you want to display only some rows but keep an all-row denominator, calculate the window in a CTE first and filter outside it. The final `ORDER BY` controls display order, independently of the ordering within a window.

## Read and run

A food stall shows each item share of its category sales.

```sql run
SELECT item, category, revenue,
       SUM(revenue) OVER (PARTITION BY category) AS category_total,
       ROUND(100.0 * revenue / NULLIF(
         SUM(revenue) OVER (PARTITION BY category), 0), 2) AS share_pct
FROM item_sales
ORDER BY category, item;
```

Bun and pie keep separate rows but use the same baked-goods denominator. Tea has 100% of its own category, not 100% of the stall total.

Filtering out pie before the window would shrink the baked-goods denominator. Calculate the total first if pie should be hidden but still contribute.
