---
title: Retain one source version per event
slug: deduplicate-event-versions
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Keep the latest received version of each logical event.
seo_title: Retain one source version per event | Data Analysis Using SQL
seo_description: Keep the latest received version of each logical event.
seo_keywords:
- SQL
- PostgreSQL
- Retain one source version per event
sql:
  seed: seed.sql
---

# Retain one source version per event

Deduplication needs both an identity key and a retention rule. Use the previously taught ROW_NUMBER in a partition for each logical event, ordered by latest arrival and then highest ingest ID.

Calculate the position in a CTE, then filter position = 1 outside it. WHERE cannot filter a window result at the same query level. The example retains one received version, not one arbitrary row. This policy may differ from keeping the first arrival, so state it before querying.

```sql run
WITH ranked AS (SELECT *,
       ROW_NUMBER() OVER (PARTITION BY event_ref
ORDER BY arrived DESC,load_id DESC) AS position
FROM deliveries) SELECT event_ref,label
FROM ranked
WHERE position=1
ORDER BY event_ref;
```
