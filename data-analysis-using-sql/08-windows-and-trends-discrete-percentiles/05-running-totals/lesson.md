---
title: Accumulate a running total with an explicit frame
slug: running-totals
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Accumulate paid amounts from the start of each member's history.
seo_title: Accumulate a running total with an explicit frame | Data Analysis Using SQL
seo_description: Accumulate paid amounts from the start of each member's history.
seo_keywords:
- SQL
- PostgreSQL
- Accumulate a running total with an explicit frame
sql:
  seed: seed.sql
---

# Accumulate a running total with an explicit frame

ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW includes every row from the partition start through the current row. A partition defines related rows; the frame defines which contribute at the current position. An explicit ROWS frame and stable ordering avoid unexpected jumps across tied ordering values.

The final refill total includes every preceding day in the series, including the zero day.

```sql run
SELECT day::text AS day,refills,SUM(refills) OVER (ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total
FROM daily_refills
ORDER BY day;
```
