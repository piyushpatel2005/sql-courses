---
title: Reduce repeated activity to one row per combination
slug: distinct-activity-rows
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Reduce repeated purchases to one member-month activity row.
seo_title: Reduce repeated activity to one row per combination | Data Analysis Using SQL
seo_description: Reduce repeated purchases to one member-month activity row.
seo_keywords:
- SQL
- PostgreSQL
- Reduce repeated activity to one row per combination
sql:
  seed: seed.sql
---

# Reduce repeated activity to one row per combination

SELECT DISTINCT removes duplicate result rows by comparing every selected column. A reader-month pair is different from either a reader alone or a raw visit record. Choose the columns that express the desired activity grain before removing duplicates.

The reading-group table has two visits for one reader in February. The query keeps one reader-month row so later joins can count that reader once. This does not delete the original visits or imply that either visit was a mistake.

```sql run
SELECT DISTINCT reader,month::text AS month
FROM visits
ORDER BY reader,month;
```
