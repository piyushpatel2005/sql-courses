---
title: Interpret an instant in a reporting zone
slug: reporting-time-zones
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Display an instant as a date in a named reporting zone.
seo_title: Interpret an instant in a reporting zone | Data Analysis Using SQL
seo_description: Display an instant as a date in a named reporting zone.
seo_keywords:
- SQL
- PostgreSQL
- Interpret an instant in a reporting zone
sql:
  seed: seed.sql
---

# Interpret an instant in a reporting zone

A timestamptz stores an instant, not the original zone label. AT TIME ZONE converts that instant to local wall-clock time in a named zone. Cast the result to date to choose a local calendar day, then text for a stable display.

The first two returns straddle UTC midnight but belong to the previous evening in New York. The third occurs after New York midnight. Named zones handle daylight-saving rules; a permanent fixed offset may not. Run both date columns and identify where they disagree. This lesson does not yet restrict the time population.

```sql run
SELECT return_id,
       (at AT TIME ZONE 'UTC')::date::text AS utc_day,
       (at AT TIME ZONE 'America/New_York')::date::text AS local_day
FROM returns_clock
ORDER BY return_id;
```
