---
title: Filter a whole calendar period
slug: date-period-filters
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Select a month with an inclusive start and exclusive next-month boundary.
seo_title: Filter a whole calendar period | Introduction to SQL
seo_description: Select a month with an inclusive start and exclusive next-month boundary.
seo_keywords:
- SQL
- PostgreSQL
- Filter a whole calendar period
sql:
  seed: seed.sql
---

# Filter a whole calendar period

A report for April should include its first day and stop before May begins. Use a half-open condition: date >= start AND date < next_start. Adjacent periods then do not share a boundary.

The typed DATE constants make the comparison explicit. The same boundary pattern works for timestamps when the reporting zone is defined. It avoids guessing a day's final representable instant. Run the parcel list and check which source date controls membership: sent_on, not delivered_on.

```sql run
SELECT parcel_id,
       sent_on::text AS sent_on
FROM shipments
WHERE sent_on >= DATE '2025-04-01' AND sent_on < DATE '2025-05-01'
ORDER BY parcel_id;
```
