---
title: Measure recency at a fixed cutoff
slug: purchase-recency
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Measure days since the latest eligible purchase at a fixed cutoff.
seo_title: Measure recency at a fixed cutoff | Data Analysis Using SQL
seo_description: Measure days since the latest eligible purchase at a fixed cutoff.
seo_keywords:
- SQL
- PostgreSQL
- Measure recency at a fixed cutoff
sql:
  seed: seed.sql
---

# Measure recency at a fixed cutoff

Recency is the number of calendar days since the last eligible purchase at an as-of date. Subtracting two dates returns an integer day count. Use the maximum eligible purchase date; the latest arrival timestamp would answer a different question.

The inspection example uses April 1, 2025 rather than today's date. A tool never inspected has NULL recency, not zero. For orders, define eligibility and the reporting zone before converting the timestamp to a date.

```sql run
SELECT tool,DATE '2025-04-01' - inspected_on AS days_since
FROM inspections
ORDER BY tool;
```
