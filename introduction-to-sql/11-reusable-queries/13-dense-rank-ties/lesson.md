---
title: Count distinct ranked levels
slug: dense-rank-ties
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Number distinct fee levels without gaps after ties.
seo_title: Count distinct ranked levels | Introduction to SQL
seo_description: Number distinct fee levels without gaps after ties.
seo_keywords:
- SQL
- PostgreSQL
- Count distinct ranked levels
sql:
  seed: seed.sql
---

# Count distinct ranked levels

DENSE_RANK assigns the same rank to peers without leaving gaps. The peer rule is determined by the expressions inside the window ORDER BY. Keep a display identifier outside that ordering when tied values should remain peers.

The market ranks sale amounts within each stall. Every detail row remains visible, unlike a grouped aggregate. The two East sales of 12 share level 1. Its sale of 8 now follows at level 2, unlike the gap left by RANK.

```sql run
SELECT stall,sale_id,amount,DENSE_RANK() OVER (PARTITION BY stall
ORDER BY amount DESC) AS rank
FROM sales
ORDER BY stall,amount DESC,sale_id;
```
