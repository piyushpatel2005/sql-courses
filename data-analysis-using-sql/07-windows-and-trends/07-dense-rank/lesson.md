---
title: Number distinct value levels with DENSE_RANK
slug: dense-rank
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Assign consecutive levels to distinct paid amounts.
seo_title: Number distinct value levels with DENSE_RANK | Data Analysis Using SQL
seo_description: Assign consecutive levels to distinct paid amounts.
seo_keywords:
- SQL
- PostgreSQL
- Number distinct value levels with DENSE_RANK
sql:
  seed: seed.sql
---

# Number distinct value levels with DENSE_RANK

DENSE_RANK shares a rank for equal ordering values without leaving gaps. Values 9, 9, 5 receive levels 1, 1, 2. It counts distinct levels rather than occupied queue positions. Keep any display tie-breaker outside the rank window.

The next distinct vote count receives the next level, with no gap. Booth is only a display tie-breaker here.

```sql run
SELECT booth,
       votes,
       DENSE_RANK() OVER (ORDER BY votes DESC) AS position
FROM votes
ORDER BY votes DESC,
       booth;
```
