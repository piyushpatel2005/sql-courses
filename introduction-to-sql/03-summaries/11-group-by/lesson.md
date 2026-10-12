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
