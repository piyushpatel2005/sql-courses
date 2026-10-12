---
title: Share tied positions with RANK
slug: competition-rank
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Give tied amounts a shared rank with gaps after ties.
seo_title: Share tied positions with RANK | Data Analysis Using SQL
seo_description: Give tied amounts a shared rank with gaps after ties.
seo_keywords:
- SQL
- PostgreSQL
- Share tied positions with RANK
sql:
  seed: seed.sql
---

# Share tied positions with RANK

RANK gives equal ordering values the same rank and leaves a gap after ties. Values 9, 9, 5 rank 1, 1, 3 in descending order. Do not add an ID inside this window: that would make the tied amounts different ordering values.

The tied booths share their rank. Inspect the next booth to see the gap left by the tie.

```sql run
SELECT booth,
       votes,
       RANK() OVER (ORDER BY votes DESC) AS position
FROM votes
ORDER BY votes DESC,
       booth;
```
