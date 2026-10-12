---
title: Advance a calendar boundary with INTERVAL
slug: calendar-intervals
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Find the next calendar-month boundary without assuming thirty days.
seo_title: Advance a calendar boundary with INTERVAL | Data Analysis Using SQL
seo_description: Find the next calendar-month boundary without assuming thirty days.
seo_keywords:
- SQL
- PostgreSQL
- Advance a calendar boundary with INTERVAL
sql:
  seed: seed.sql
---

# Advance a calendar boundary with INTERVAL

An INTERVAL describes a duration or calendar step. Adding INTERVAL '1 month' to a first-of-month date gives the next month boundary; it is not a fixed thirty-day addition. Cast the result back to date when a report uses calendar keys.

The examples cross a year boundary and a short month. Run them and compare the resulting dates. First-of-month inputs avoid the separate problem of deciding what a month after January 31 should mean.

```sql run
SELECT label,(day + INTERVAL '1 month')::date::text AS next_month
FROM starts
ORDER BY label;
```
