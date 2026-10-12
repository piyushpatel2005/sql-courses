---
title: Look ahead one observation with LEAD
slug: next-observation
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Read the following purchase within each member's sequence.
seo_title: Look ahead one observation with LEAD | Data Analysis Using SQL
seo_description: Read the following purchase within each member's sequence.
seo_keywords:
- SQL
- PostgreSQL
- Look ahead one observation with LEAD
sql:
  seed: seed.sql
---

# Look ahead one observation with LEAD

LEAD(value) reads the following row under the window ORDER BY. PARTITION BY restarts the sequence for each entity. If there is no such neighbor, the default result is NULL.

The function moves by rows, not elapsed days. The sensor has a gap in its dates, so the next visible row is not necessarily tomorrow and the prior row is not necessarily yesterday. Keep that grain in the interpretation. Add a stable key when timestamps tie.

```sql run
SELECT day::text AS day,reading,LEAD(reading) OVER (ORDER BY day) AS neighbor
FROM readings
ORDER BY day;
```
