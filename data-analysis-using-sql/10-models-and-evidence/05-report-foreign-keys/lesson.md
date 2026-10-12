---
title: Protect a reporting relationship with REFERENCES
slug: report-foreign-keys
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Require known reporting relationships to match their parent key.
seo_title: Protect a reporting relationship with REFERENCES | Data Analysis Using SQL
seo_description: Require known reporting relationships to match their parent key.
seo_keywords:
- SQL
- PostgreSQL
- Protect a reporting relationship with REFERENCES
sql:
  seed: seed.sql
---

# Protect a reporting relationship with REFERENCES

REFERENCES parent(key) requires a non-NULL child key to match an existing parent row. It does not automatically populate the child or join the tables when selected. A nullable child key still permits NULL; NOT NULL is needed when the relationship must always be present.

Create the parent first. The seed-bank child references its supplied seed dimension. Review the declaration: an empty result cannot prove that unmatched future inserts would be rejected.

```sql run
CREATE TABLE IF NOT EXISTS report_issues(issue_id integer PRIMARY KEY,seed_id integer REFERENCES seed_dimension(seed_id));
SELECT issue_id,seed_id
FROM report_issues;
```
