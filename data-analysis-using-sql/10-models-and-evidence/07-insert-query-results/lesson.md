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

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `report_issues`

One row represents one stored seed-bank issue.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `issue_id` · `integer` | Issue record identifier; key enforcement depends on this lesson's declaration. | Primary key; unique. Required; cannot be `NULL`. |
| `packets` · `integer` | Whole-number count of packets on the issue. | Nullable; `NULL` means the packets measure is unrecorded, not zero. |

#### `source_issues`

One row represents one source seed-bank issue.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `issue_id` · `integer` | Source issue identifier, not constrained as a key in this fixture. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `packets` · `integer` | Whole-number count of packets in this issue. | Nullable; `NULL` means the packets measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

INSERT INTO target(columns) SELECT ... copies query results into an existing table. List target columns so their mapping does not depend on physical column order. The SELECT must return compatible values in that same order.

The demo clears its disposable destination before copying again. DELETE FROM report_issues removes all its rows but preserves its schema; that reset is supplied scaffolding, not a production loading policy. The learning change is the INSERT ... SELECT statement.

```sql run
DELETE FROM report_issues;
INSERT INTO report_issues (issue_id, packets)
SELECT issue_id, packets FROM source_issues;
SELECT issue_id, packets
FROM report_issues
ORDER BY issue_id;
```
