---
title: Reconcile independent sources and name the limits
slug: reconcile-independent-totals
order: 11
language: sql
runtime: sql
lesson_type: interactive
summary: Compare independent totals without hiding unmatched keys.
seo_title: Reconcile independent sources and name the limits | Data Analysis Using SQL
seo_description: Compare independent totals without hiding unmatched keys.
seo_keywords:
- SQL analysis
- reconcile independent totals
- PostgreSQL
sql:
  seed: seed.sql
---

# Reconcile independent sources and name the limits

A total that agrees with itself is not an audit. Compare independently derived measures at the same grain, units, and cutoff.

A `FULL JOIN` keeps unmatched rows from both inputs. It is useful for reconciliation because either source may contain a record the other lacks. Aggregate detailed lines before joining them to order totals, then report a difference. Null source amounts and genuinely absent sources require an explicit policy; this example compares known paid amounts with complete supplied lines.

A zero difference establishes agreement under this check, not universal correctness. Both sources could share an upstream mistake. In a written finding, name the population, units, observed difference, and caveat. A regional or channel difference is an association; it does not establish that region or channel caused spending. Small sample sizes and unmatched records should accompany the conclusion.

## Read and run

A local kiosk compares a register summary with a bank settlement export.

```sql run
SELECT COALESCE(r.batch, b.batch) AS batch,
       r.amount AS register_amount, b.amount AS bank_amount,
       COALESCE(r.amount, 0) - COALESCE(b.amount, 0) AS difference
FROM register_totals r FULL JOIN bank_totals b ON b.batch = r.batch
ORDER BY batch;
```

Batches 2 and 3 remain visible because each exists on only one side. An inner join would report only the matching batch and make the reconciliation look complete.

An inner join would hide the one-sided batches. A matching total on the remaining row would not make the two sources complete.
