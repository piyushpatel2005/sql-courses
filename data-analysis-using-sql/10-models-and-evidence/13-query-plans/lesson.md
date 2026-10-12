---
title: Inspect the proposed query plan
slug: query-plans
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Read a proposed query plan before changing the schema.
seo_title: Inspect the proposed query plan | Data Analysis Using SQL
seo_description: Read a proposed query plan before changing the schema.
seo_keywords:
- SQL
- PostgreSQL
- Inspect the proposed query plan
sql:
  seed: seed.sql
---

# Inspect the proposed query plan

EXPLAIN shows planned operations without executing an ordinary SELECT. COSTS OFF hides estimates so you can focus on the access path and filter. A sequential scan can be reasonable on a tiny table; cost units are not elapsed milliseconds.

Read the fixture plan before proposing any optimization. EXPLAIN ANALYZE would actually execute the query, so treat that option carefully with writes or expensive work. This lesson checks a fixed plan for a fixed snapshot, not a general optimizer guarantee.

```sql run
EXPLAIN (COSTS OFF) SELECT ticket,minutes
FROM plan_tickets
WHERE ticket=2;
```
