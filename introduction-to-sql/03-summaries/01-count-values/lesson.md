---
title: Count rows and known values with COUNT
slug: count-values
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Distinguish the number of rows from the number of known notes.
seo_title: Count rows and known values with COUNT | Introduction to SQL
seo_description: Distinguish the number of rows from the number of known notes.
seo_keywords:
- SQL
- PostgreSQL
- Count rows and known values with COUNT
sql:
  seed: seed.sql
---

# Count rows and known values with COUNT

COUNT(*) counts rows. COUNT(column) counts only non-NULL values in that column. Their difference measures missingness, not missing rows. An aggregate without GROUP BY produces one summary row. On empty input both counts are zero.

Compare the two counts in the sales result. A sale without a voucher is still a sale.

```sql run
SELECT COUNT(*) AS sales_count,
       COUNT(voucher) AS with_voucher
FROM sales;
```
