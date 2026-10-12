---
title: Share a business rank across ties
slug: rank-ties
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Give tied fees the same rank and leave a gap afterward.
seo_title: Share a business rank across ties | Introduction to SQL
seo_description: Give tied fees the same rank and leave a gap afterward.
seo_keywords:
- SQL
- PostgreSQL
- Share a business rank across ties
sql:
  seed: seed.sql
---

# Share a business rank across ties

RANK assigns the same rank to peers and leaves a gap after them. The peer rule is determined by the expressions inside the window ORDER BY. Keep a display identifier outside that ordering when tied values should remain peers.

The market ranks sale amounts within each stall. Every detail row remains visible, unlike a grouped aggregate. The two East sales of 12 share rank 1; its sale of 8 follows at rank 3.

```sql run
SELECT stall,sale_id,amount,RANK() OVER (PARTITION BY stall
ORDER BY amount DESC) AS rank
FROM sales
ORDER BY stall,amount DESC,sale_id;
```
