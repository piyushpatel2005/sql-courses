---
title: Name analysis steps with CTEs
slug: name-analysis-steps
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Separate a member summary from the rule that labels it.
seo_title: Name analysis steps with CTEs | Data Analysis Using SQL
seo_description: Separate a member summary from the rule that labels it.
seo_keywords:
- SQL analysis
- name analysis steps
- PostgreSQL
sql:
  seed: seed.sql
---

# Name analysis steps with CTEs

A report becomes easier to review when each step has a name and a declared grain. Use a common table expression to separate calculation from selection.

`WITH name AS (query)` defines a named result for one SQL statement. The final query can read that name as if it were a table. Multiple CTEs are separated by commas, and a later CTE can refer to an earlier one. Each closing parenthesis marks a useful checkpoint: name the columns and what one row means.

A CTE improves organization; it does not automatically cache results or make a query faster. It also ends with the statement, so another Run does not inherit it. We will use views next when a report needs a reusable name.

## Read and run

A volunteer desk first totals hours per person, then labels participation.

```sql run
WITH totals AS (
  SELECT person, SUM(hours) AS hours
  FROM shifts GROUP BY person
)
SELECT person, hours,
       CASE WHEN hours >= 4 THEN 'regular' ELSE 'occasional' END AS band
FROM totals
ORDER BY person;
```

The CTE has one row per volunteer, not per shift. The final CASE therefore labels volunteers by their total contribution.

A new shift changes one volunteer total. It does not create a second volunteer row in the CTE.
