---
title: Measure purchase frequency at order grain
slug: purchase-frequency
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Count eligible orders while retaining members who never bought.
seo_title: Measure purchase frequency at order grain | Data Analysis Using SQL
seo_description: Count eligible orders while retaining members who never bought.
seo_keywords:
- SQL
- PostgreSQL
- Measure purchase frequency at order grain
sql:
  seed: seed.sql
---

# Measure purchase frequency at order grain

Frequency counts eligible purchases, not order lines or event arrivals. Start with members and left join eligible orders when never-buyers must remain. Count the order key rather than COUNT(*): a left join still gives an unmatched member one null-extended row.

The library example keeps a reader with no loans and assigns a genuine frequency of zero. Several loans by one reader are separate actions, so this measure deliberately does not use COUNT(DISTINCT reader).

```sql run
SELECT r.reader,COUNT(l.loan) AS loans
FROM readers r
LEFT JOIN loans l ON l.reader=r.reader
GROUP BY r.reader
ORDER BY r.reader;
```
