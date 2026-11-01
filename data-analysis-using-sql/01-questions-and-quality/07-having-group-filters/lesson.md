---
title: Filter completed groups with HAVING
slug: having-group-filters
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Select repeated-key groups after their counts are known.
seo_title: Filter completed groups with HAVING | Data Analysis Using SQL
seo_description: Select repeated-key groups after their counts are known.
seo_keywords:
- SQL
- PostgreSQL
- Filter completed groups with HAVING
sql:
  seed: seed.sql
---

# Filter completed groups with HAVING

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

HAVING tests a condition after groups have been formed. WHERE tests individual input rows before that happens. A repeated-key diagnostic therefore uses HAVING COUNT(*) > 1 rather than trying to put the aggregate in WHERE.

Start with the grouped counts from the preceding lesson and retain only keys with several records. A repeated business key is a reason to investigate, not an automatic deletion rule: the rows may be revisions or legitimate separate events.

```sql run
SELECT reader_ref,COUNT(*) AS copies
FROM imports
GROUP BY reader_ref
HAVING COUNT(*) > 1
ORDER BY reader_ref;
```
