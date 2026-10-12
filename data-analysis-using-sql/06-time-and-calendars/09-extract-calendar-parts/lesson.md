---
title: Read a date component with EXTRACT
slug: extract-calendar-parts
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Read the year and month components of a period key.
seo_title: Read a date component with EXTRACT | Data Analysis Using SQL
seo_description: Read the year and month components of a period key.
seo_keywords:
- SQL
- PostgreSQL
- Read a date component with EXTRACT
sql:
  seed: seed.sql
---

# Read a date component with EXTRACT

EXTRACT(YEAR FROM date) and EXTRACT(MONTH FROM date) read named numeric components from a date. A month number alone does not identify a reporting period because it repeats every year.

A calendar-month offset can use 12 * (later_year - earlier_year) + later_month - earlier_month. That works across years, unlike subtracting month numbers alone. This lesson practices extraction; the cohort section later applies those components to period comparisons.

```sql run
SELECT label,EXTRACT(YEAR
FROM day) AS year,EXTRACT(MONTH
FROM day) AS month_number
FROM starts
ORDER BY label;
```
