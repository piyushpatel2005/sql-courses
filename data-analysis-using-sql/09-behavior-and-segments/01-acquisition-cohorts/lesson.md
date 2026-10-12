---
title: Build a cohort from the first eligible purchase
slug: acquisition-cohorts
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Assign members to the month of their first eligible purchase.
seo_title: Build a cohort from the first eligible purchase | Data Analysis Using SQL
seo_description: Assign members to the month of their first eligible purchase.
seo_keywords:
- SQL analysis
- acquisition cohorts
- PostgreSQL
sql:
  seed: seed.sql
---

# Build a cohort from the first eligible purchase

A cohort fixes membership at a starting event. Define that event before comparing later behavior across groups.

An acquisition cohort here means the UTC month of a registered member's first paid order before April 1, 2025. It is not their signup month. First filter to eligible purchases, then find each member's `MIN` purchase time, then bucket it into a month. Members without paid purchases have no acquisition cohort.

Do not compute a separate first purchase within each reporting month: that would let the same member re-enter new cohorts. This fixture contains the full prior purchase history for the defined analysis. In a truncated extract, the first observed purchase might not be the true first purchase; report that limitation.

## Read and run

A ceramics studio groups volunteers by their first completed shift month.

```sql run
WITH first_shift AS (
  SELECT person, MIN(at) AS first_at
  FROM volunteer_shifts WHERE state = 'done'
  GROUP BY person
)
SELECT person,
       DATE_TRUNC('month', first_at AT TIME ZONE 'UTC')::date::text AS cohort
FROM first_shift ORDER BY person;
```

Ira belongs to January even after returning in February. Tao has no completed-shift cohort, rather than a January cohort with zero activity.

Ira can return in several months but belongs to one acquisition cohort. Reassigning the cohort on each visit would erase that starting point.
