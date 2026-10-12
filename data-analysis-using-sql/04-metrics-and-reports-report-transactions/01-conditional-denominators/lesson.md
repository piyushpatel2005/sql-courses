---
title: Count matching rows with FILTER
slug: conditional-denominators
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Count a qualifying subset without removing the other input rows.
seo_title: Count matching rows with FILTER | Data Analysis Using SQL
seo_description: Count a qualifying subset without removing the other input rows.
seo_keywords:
- SQL
- PostgreSQL
- Count matching rows with FILTER
sql:
  seed: seed.sql
---

# Count matching rows with FILTER

FILTER attaches a condition to one aggregate without removing rows from the surrounding query. COUNT(*) FILTER (WHERE fulfilled) can therefore sit beside an unconditional COUNT(*) over the same groups.

The tool desk needs both submitted and fulfilled counts. A WHERE on the whole query would remove failures from both counts. Run the example and check that unsuccessful requests still contribute to requests. This distinction will matter when the next lesson divides one count by the other.

```sql run
SELECT desk,
       COUNT(*) AS requests,
       COUNT(*) FILTER (WHERE fulfilled) AS fulfilled
FROM requests
GROUP BY desk
ORDER BY desk;
```
