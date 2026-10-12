---
title: Protect report row identity with a primary key
slug: report-primary-keys
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Protect the identity of an order-grain reporting row.
seo_title: Protect report row identity with a primary key | Data Analysis Using SQL
seo_description: Protect the identity of an order-grain reporting row.
seo_keywords:
- SQL
- PostgreSQL
- Protect report row identity with a primary key
sql:
  seed: seed.sql
---

# Protect report row identity with a primary key

PRIMARY KEY requires a unique, non-NULL identity. It prevents duplicate fact IDs even when other values match. The key should agree with what one report row represents; one order ID cannot identify several independent order-line rows.

The seed-bank definition is empty, so the final SELECT shows headings rather than data. IF NOT EXISTS makes the demonstration repeatable but does not verify an existing design. Result grading cannot establish schema enforcement; inspect the declaration yourself.

```sql run
CREATE TABLE IF NOT EXISTS report_issues (issue_id integer PRIMARY KEY,packets integer);
SELECT issue_id,packets
FROM report_issues;
```
