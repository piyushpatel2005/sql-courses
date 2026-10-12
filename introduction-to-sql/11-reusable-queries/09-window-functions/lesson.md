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
