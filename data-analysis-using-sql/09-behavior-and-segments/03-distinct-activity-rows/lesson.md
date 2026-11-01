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

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `visits`

One row represents one recorded reading-group visit.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `reader` · `integer` | Reader identity label for the visit. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `month` · `date` | First-of-month activity date; repeated reader-month pairs represent several visits. | Nullable; `NULL` means the calendar date is unrecorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The date is an activity-month bucket, not a signup cohort. Neither first-of-month values nor unique pairs are declared constraints.

SELECT DISTINCT removes duplicate result rows by comparing every selected column. A reader-month pair is different from either a reader alone or a raw visit record. Choose the columns that express the desired activity grain before removing duplicates.

The reading-group table has two visits for one reader in February. The query keeps one reader-month row so later joins can count that reader once. This does not delete the original visits or imply that either visit was a mistake.

```sql run
SELECT DISTINCT reader,month::text AS month
FROM visits
ORDER BY reader,month;
```
