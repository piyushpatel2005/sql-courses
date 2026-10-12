---
title: Load query results with INSERT ... SELECT
slug: insert-query-results
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Populate a reporting table from selected source rows.
seo_title: Load query results with INSERT ... SELECT | Data Analysis Using SQL
seo_description: Populate a reporting table from selected source rows.
seo_keywords:
- SQL
- PostgreSQL
- Load query results with INSERT ... SELECT
sql:
  seed: seed.sql
---

# Load query results with INSERT ... SELECT

INSERT INTO target(columns) SELECT ... copies query results into an existing table. List target columns so their mapping does not depend on physical column order. The SELECT must return compatible values in that same order.

The demo clears its disposable destination before copying again. DELETE FROM report_issues removes all its rows but preserves its schema; that reset is supplied scaffolding, not a production loading policy. The learning change is the INSERT ... SELECT statement.

```sql run
DELETE
FROM report_issues;
INSERT INTO report_issues(issue_id,packets) SELECT issue_id,packets
FROM source_issues;
SELECT issue_id,packets
FROM report_issues
ORDER BY issue_id;
```
