---
title: Read a query plan with EXPLAIN
slug: explain-plans
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Inspect the proposed operations for a query.
seo_title: Read a query plan with EXPLAIN | Introduction to SQL
seo_description: Inspect the proposed operations for a query.
seo_keywords:
- SQL
- PostgreSQL
- Read a query plan with EXPLAIN
sql:
  seed: seed.sql
---

# Read a query plan with EXPLAIN

EXPLAIN shows proposed operations without executing an ordinary SELECT. EXPLAIN (COSTS OFF) hides cost estimates so this example focuses on the work. A Seq Scan reads the table and filters rows; an Index Scan uses an index to locate candidates.

Tiny tables can favor a sequential scan even with an index. Costs are estimates, not milliseconds. EXPLAIN ANALYZE does execute the statement, so do not add ANALYZE casually to writes. Run this plan, identify its filter, and treat its operation choice as specific to this fixture.

```sql run
EXPLAIN (COSTS OFF) SELECT item
FROM menu
WHERE section = 'drink';
```
