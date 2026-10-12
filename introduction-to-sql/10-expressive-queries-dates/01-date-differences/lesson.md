---
title: Calculate calendar days between dates
slug: date-differences
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate the number of calendar days between two dates.
seo_title: Calculate calendar days between dates | Introduction to SQL
seo_description: Calculate the number of calendar days between two dates.
seo_keywords:
- SQL
- PostgreSQL
- Calculate calendar days between dates
sql:
  seed: seed.sql
---

# Calculate calendar days between dates

A date stores a calendar day without a time of day. The typed literal DATE '2025-04-01' explicitly creates that type. Subtracting one date from another returns a whole number of days; adding an integer to a date advances it by that many days.

The parcel report subtracts dispatch from delivery. This is calendar arithmetic, not elapsed hours across daylight-saving transitions. A timestamp stores a date and time, and a timestamp with time zone represents an instant. Those distinctions matter when a report moves beyond whole dates.

```sql run
SELECT parcel_id,
       delivered_on - sent_on AS travel_days
FROM shipments
ORDER BY parcel_id;
```
