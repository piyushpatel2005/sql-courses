---
title: Apply a segment policy to prepared RFM measures
slug: rfm-segment-policy
order: 17
language: sql
lesson_type: interactive
runtime: sql
summary: Apply a stated segment rule to recency, frequency and monetary measures.
seo_title: Apply a segment policy to prepared RFM measures | Data Analysis Using SQL
seo_description: Apply a stated segment rule to recency, frequency and monetary measures.
seo_keywords:
- SQL
- PostgreSQL
- Apply a segment policy to prepared RFM measures
sql:
  seed: seed.sql
---

# Apply a segment policy to prepared RFM measures

The preceding lessons defined recency, frequency and monetary value separately. A segment now applies a business rule to those measures. Use CASE to give never-buyers their own state before considering recency thresholds.

The prepared demonstration table already has RFM values. A repeat buyer is recent only under the stated cutoff and threshold. These operational labels summarize observed behavior; they do not predict loyalty or establish why someone bought.

```sql run
SELECT person,CASE WHEN frequency=0 THEN 'never_bought' WHEN frequency>=2 AND recency<=30 THEN 'recent_repeat' ELSE 'other' END AS segment
FROM prepared_rfm
ORDER BY person;
```
