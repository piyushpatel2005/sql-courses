---
title: Assign a unique position with ROW_NUMBER
slug: row-number
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Assign each paid order a unique position with a stable tie-breaker.
seo_title: Assign a unique position with ROW_NUMBER | Data Analysis Using SQL
seo_description: Assign each paid order a unique position with a stable tie-breaker.
seo_keywords:
- SQL
- PostgreSQL
- Assign a unique position with ROW_NUMBER
sql:
  seed: seed.sql
---

# Assign a unique position with ROW_NUMBER

ROW_NUMBER assigns a distinct position to each row in a window. Add a stable key to break ties when exactly one row must occupy each position. The window order assigns numbers; the final ORDER BY controls display.

Tied vote counts receive different positions because booth breaks the tie. That is useful for a queue with one occupant per position.

```sql run
SELECT booth,
       votes,
       ROW_NUMBER() OVER (ORDER BY votes DESC,
       booth) AS position
FROM votes
ORDER BY votes DESC,
       booth;
```
