---
title: Group records by a business key
slug: group-records
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Count imported records for each business key.
seo_title: Group records by a business key | Data Analysis Using SQL
seo_description: Count imported records for each business key.
seo_keywords:
- SQL
- PostgreSQL
- Group records by a business key
sql:
  seed: seed.sql
---

# Group records by a business key

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `imports`

One row represents one received import record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `load_id` · `integer` | Receipt identifier, not the identity of a person. | Nullable; `NULL` means the identifier or reference is unrecorded. |
| `reader_ref` · `text` | Text business reference for the supposed reader; repeated references can belong to separate receipts. | Nullable; `NULL` means the logical business identity is unrecorded; this is not a new known identity. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

No reader directory or identity constraint is supplied. Repeated business references are a review signal, not proof that a record should be deleted.

GROUP BY collects rows with the same key into a group. A selected group key names each output row, and COUNT(*) describes the rows inside it. ORDER BY still controls display; grouping alone promises no order.

The import ID identifies a received record, while reader_ref identifies a supposed person. Grouping by load IDs would miss repeated person references. Run the counts and keep every group, including groups of size one. The next lesson chooses which groups need review.

```sql run
SELECT reader_ref,COUNT(*) AS copies
FROM imports
GROUP BY reader_ref
ORDER BY reader_ref;
```
