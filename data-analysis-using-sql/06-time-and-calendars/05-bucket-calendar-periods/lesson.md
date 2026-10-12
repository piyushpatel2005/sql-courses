---
title: Bucket calendar months without losing the year
slug: bucket-calendar-periods
order: 5
language: sql
runtime: sql
lesson_type: interactive
summary: Group timestamps by a month boundary that retains the year.
seo_title: Bucket calendar months without losing the year | Data Analysis Using SQL
seo_description: Group timestamps by a month boundary that retains the year.
seo_keywords:
- SQL analysis
- bucket calendar periods
- PostgreSQL
sql:
  seed: seed.sql
---

# Bucket calendar months without losing the year

A month label needs a year and a zone. Group by a real month boundary instead of a month name that would merge different years.

`DATE_TRUNC('month', timestamp)` moves a timestamp to the start of its calendar month. Convert an instant to the reporting zone first so bucketing does not depend on a session setting. Casting the boundary to date gives a compact grouping key.

A first-of-month date is a useful reporting key because it keeps both the year and month. Later calendar arithmetic can use that same boundary.

## Read and run

A seed bank tracks bags distributed across a year boundary.

```sql run
SELECT DATE_TRUNC('month', at AT TIME ZONE 'UTC')::date::text AS month,
       SUM(bags) AS bags
FROM distributions
GROUP BY DATE_TRUNC('month', at AT TIME ZONE 'UTC')::date
ORDER BY month;
```

The first-of-month key keeps December 2024 separate from January 2025. It can also be sorted chronologically as ISO date text.

A January record from another year needs another group. The complete date key preserves that distinction.
