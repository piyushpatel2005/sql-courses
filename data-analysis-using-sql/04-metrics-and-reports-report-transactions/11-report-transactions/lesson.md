---
title: Commit a reporting change as one transaction
slug: report-transactions
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Commit a reporting definition inside an explicit transaction.
seo_title: Commit a reporting change as one transaction | Data Analysis Using SQL
seo_description: Commit a reporting definition inside an explicit transaction.
seo_keywords:
- SQL
- PostgreSQL
- Commit a reporting change as one transaction
sql:
  seed: seed.sql
---

# Commit a reporting change as one transaction

BEGIN starts a transaction. COMMIT accepts its changes together, while ROLLBACK cancels uncommitted changes. This is useful when a reporting definition must not be left half-updated. A transaction does not freeze later source updates.

Wrap the already familiar view definition in a transaction, then inspect the result after COMMIT. Run and Submit reset coding lessons to their supplied snapshots; committing does not preserve an attempt through a lesson reset. Result checks cannot establish that a transaction was used.

```sql run
BEGIN;
CREATE OR REPLACE VIEW clean_bins AS SELECT bin_id,
       NULLIF(LOWER(TRIM(label)),
       '') AS label
FROM stock_labels;
COMMIT;
SELECT bin_id,
       label
FROM clean_bins
ORDER BY bin_id;
```
