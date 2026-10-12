---
title: Declare an index for a filter column
slug: index-a-report-filter
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Declare a timestamp index without promising a faster tiny-fixture query.
seo_title: Declare an index for a filter column | Data Analysis Using SQL
seo_description: Declare a timestamp index without promising a faster tiny-fixture query.
seo_keywords:
- SQL
- PostgreSQL
- Declare an index for a filter column
sql:
  seed: seed.sql
---

# Declare an index for a filter column

CREATE INDEX name ON table(column) adds a data-access structure. It does not change which rows a query means. Indexes cost storage and maintenance on writes, and the planner may ignore one when scanning the whole tiny table is cheaper.

The lookup keeps the indexed column unwrapped in its predicate. Compare the same logical result before and after adding an index. Use the plan-reading technique from the previous lesson to investigate rather than promising a speedup.

```sql run
CREATE INDEX IF NOT EXISTS plan_minutes_idx ON plan_tickets(minutes);
SELECT ticket,minutes
FROM plan_tickets
WHERE minutes >= 0
ORDER BY ticket;
```
