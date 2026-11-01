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

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `stock_labels`

One row represents one stock-bin label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `bin_id` · `integer` | Bin record identifier. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `label` · `text` | Raw bin label with original spaces and letter case; a spaces-only label is stored text. | Nullable; `NULL` means no label value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `clean_bins`

One row represents one source bin-label record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `bin_id` · `integer` | Bin identifier inherited from stock_labels; no unique source key is declared. | May be `NULL` under its source or expression policy. |
| `label` · `text` | Trimmed, lowercase bin label; a blank cleaned label becomes NULL. | May be `NULL` under its source or expression policy. |

This ordinary view stores a query definition, not frozen rows; it has no independently declared primary key, foreign key or NOT NULL constraint.

This view is created by the example, not preloaded. It keeps source-bin row grain and reads current labels rather than freezing their values.

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
