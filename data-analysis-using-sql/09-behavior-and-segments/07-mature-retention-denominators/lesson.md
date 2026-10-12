---
title: Separate zero retention from an unobserved period
slug: mature-retention-denominators
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Compare only cohorts with a fully observed next calendar month.
seo_title: Separate zero retention from an unobserved period | Data Analysis Using SQL
seo_description: Compare only cohorts with a fully observed next calendar month.
seo_keywords:
- SQL analysis
- mature retention denominators
- PostgreSQL
sql:
  seed: seed.sql
---

# Separate zero retention from an unobserved period

A young cohort has not had the same chance to return as an older one. Compare only fully observed follow-up periods.

Month-one retention here means at least one paid purchase in the calendar month after acquisition. It does not mean within 30 days, nor any time on or after month one. The denominator remains the original purchaser cohort size. Use the distinct member-month result from the preceding practice so several purchases count as one retained member.

At the April 1, 2025 cutoff, January and February cohorts have complete next months; March does not. This lesson excludes immature cohorts from the month-one table rather than labeling them 0%. In a full retention grid, show their future cells as unobserved. A calendar month offset can be calculated as `12 * (activity_year - cohort_year) + activity_month - cohort_month`, using EXTRACT; subtracting only month numbers would fail across years.

## Read and run

A reading group follows a two-reader January cohort into February; one reader returns twice.

```sql run
WITH activity AS (
  SELECT DISTINCT reader, month FROM reading_visits
)
SELECT c.cohort::text AS cohort, COUNT(DISTINCT c.reader) AS cohort_size,
       COUNT(a.reader) AS retained
FROM cohort_readers c
LEFT JOIN activity a ON a.reader = c.reader
 AND a.month = (c.cohort + INTERVAL '1 month')::date
WHERE c.cohort + INTERVAL '2 months' <= DATE '2025-04-01'
GROUP BY c.cohort ORDER BY c.cohort;
```

The January denominator is two readers and the numerator is one reader, despite two visits. March is absent because its next month is not complete at the fixed cutoff.

A missing March row means its follow-up is incomplete, not that nobody returned. Keep that distinction in the report label.
