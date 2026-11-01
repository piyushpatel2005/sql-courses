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

## Data model

### Example data

### Tables and views to define

These objects do not exist in the starting database. Their fields describe the target definition, not additional columns already available to the starter.

#### `report_issues`

One row represents one stored seed-bank issue.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `issue_id` · `integer` | Issue record identifier; key enforcement depends on this lesson's declaration. | Primary key; unique. Required; cannot be `NULL`. |
| `packets` · `integer` | Whole-number count of packets on the issue. | Nullable; `NULL` means the packets measure is unrecorded, not zero. |

PRIMARY KEY requires a unique, non-NULL identity. It prevents duplicate fact IDs even when other values match. The key should agree with what one report row represents; one order ID cannot identify several independent order-line rows.

This version makes `issue_id` the identity of one seed-bank issue. `packets` remains a count and can repeat on different issues. The table is still empty, so its displayed rows alone cannot show the new protection: a duplicate or NULL issue ID would be rejected on insertion.

`IF NOT EXISTS` makes this demo repeatable, but it does not add a primary key to an existing table with the wrong design. Review the declaration as well as the output.

```sql run
CREATE TABLE IF NOT EXISTS report_issues (
  issue_id integer PRIMARY KEY,
  packets integer
);
SELECT issue_id, packets
FROM report_issues;
```
