---
title: Give a query stage a name with WITH
slug: common-table-expressions
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Name a summary for the duration of one statement.
seo_title: Give a query stage a name with WITH | Introduction to SQL
seo_description: Name a summary for the duration of one statement.
seo_keywords:
- SQL
- PostgreSQL
- common table expressions
sql:
  seed: seed.sql
---

# Give a query stage a name with WITH

A common table expression, or CTE, gives a query result a name for one statement. `WITH stall_totals AS (...)` computes an aggregate stage that the following SELECT can read. This is useful when a question is easier to understand in steps.

The cafe-market example first makes one row per stall, then filters that small summary. We could write the same aggregate condition with HAVING. The CTE separates 'calculate the totals' from 'choose which totals to report', which becomes helpful as reports grow.

Run the example and expect East and West. Notice the closing parenthesis before the outer SELECT, with no semicolon between them. The CTE belongs to that one statement; it is not a persistent view and cannot be selected in a later independent statement.

A CTE is primarily a naming and structuring tool, not a guarantee of faster execution or a physical temporary table. PostgreSQL may inline or materialize it depending on the query and settings. Recursive CTEs solve another class of problems, such as walking a hierarchy; this first example is deliberately nonrecursive.

```sql run
WITH stall_totals AS (
  SELECT stall, SUM(amount) AS total
  FROM sales GROUP BY stall
)
SELECT stall, total FROM stall_totals
WHERE total >= 15 ORDER BY stall;
```
