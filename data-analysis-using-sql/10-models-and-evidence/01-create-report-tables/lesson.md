---
title: Create an empty reporting table
slug: create-report-tables
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Declare an empty reporting table with purposeful column types.
seo_title: Create an empty reporting table | Data Analysis Using SQL
seo_description: Declare an empty reporting table with purposeful column types.
seo_keywords:
- SQL
- PostgreSQL
- Create an empty reporting table
sql:
  seed: seed.sql
---

# Create an empty reporting table

## Data model

### Example data

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `report_issues`

One row represents one stored seed-bank issue.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `issue_id` · `integer` | Issue record identifier; key enforcement depends on this lesson's declaration. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `packets` · `integer` | Whole-number count of packets on the issue. | Nullable; `NULL` means the packets measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

So far, views have named queries over the source. A reporting table instead owns stored rows, which means we must choose its types and load it deliberately.

CREATE TABLE declares column names and types. It does not populate rows. integer holds whole numbers, text holds labels, and numeric(10,2) holds exact decimals with two fractional digits. Choose the type according to the meaning of the field.

The seed-bank definition is empty, so the final SELECT shows headings rather than data. IF NOT EXISTS makes the demonstration repeatable but does not verify an existing design. Result grading cannot establish schema enforcement; inspect the declaration yourself.

```sql run
CREATE TABLE IF NOT EXISTS report_issues (
  issue_id integer,
  packets integer
);
SELECT issue_id, packets
FROM report_issues;
```
