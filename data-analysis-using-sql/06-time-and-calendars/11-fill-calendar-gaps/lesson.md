---
title: Fill calendar gaps before measuring trends
slug: fill-calendar-gaps
order: 11
language: sql
runtime: sql
lesson_type: interactive
summary: Build a complete daily report from a known-complete activity feed.
seo_title: Fill calendar gaps before measuring trends | Data Analysis Using SQL
seo_description: Build a complete daily report from a known-complete activity feed.
seo_keywords:
- SQL analysis
- fill calendar gaps
- PostgreSQL
sql:
  seed: seed.sql
---

# Fill calendar gaps before measuring trends

A missing day can mean zero activity or a broken feed. Once the feed is known to be complete, a date spine lets the report show zero-activity days explicitly.

`GENERATE_SERIES(start, stop, step)` produces a sequence, including the stop when it lands on the sequence. With timestamp boundaries and an interval it can generate calendar days. Alias its output with `AS g(day)` so later CTEs can refer to a clear name.

Aggregate activity to one row per day first, then left join it onto the date spine. The spine defines the report population. `COALESCE(total, 0)` is justified only because this fixture is a complete feed. For a real interrupted feed, keep a separate completeness flag rather than claiming zero sales.

## Read and run

A community oven records bread sales on two of three observed days.

```sql run
WITH calendar AS (
  SELECT day::date AS day
  FROM GENERATE_SERIES(TIMESTAMP '2025-02-10',
       TIMESTAMP '2025-02-12', INTERVAL '1 day') AS g(day)
)
SELECT c.day::text AS day, COALESCE(s.loaves, 0) AS loaves
FROM calendar c LEFT JOIN bread_sales s ON s.day = c.day
ORDER BY c.day;
```

February 11 is present with zero loaves. That row is a reporting assumption supported by the complete fixture, not something the left join can prove about a real source.

If the till were offline on February 11, this query would still display zero. Explain why the same output would no longer be a reliable activity report before trying the next exercise.
