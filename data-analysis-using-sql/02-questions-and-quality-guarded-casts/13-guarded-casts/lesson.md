---
title: Convert approved text to numeric
slug: guarded-casts
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Convert approved fee text while leaving rejected values missing.
seo_title: Convert approved text to numeric | Data Analysis Using SQL
seo_description: Convert approved fee text while leaving rejected values missing.
seo_keywords:
- SQL
- PostgreSQL
- Convert approved text to numeric
sql:
  seed: seed.sql
---

# Convert approved text to numeric

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `deposits`

One row represents one tagged deposit record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `tag` · `integer` | Deposit record identifier. | Nullable; `NULL` means no tag value is recorded. |
| `raw_value` · `text` | Untrusted deposit amount text intended to represent USD; not yet a numeric amount. | Nullable; `NULL` means no raw value value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The query applies a nonnegative-decimal text policy. That policy is not a table CHECK constraint; invalid words and blank strings remain source values.

CAST(value AS numeric) turns a valid numeric string into a number. PostgreSQL also accepts value::numeric. Invalid text causes an error, so use the CASE and validation test from the preceding lessons to evaluate the cast only for approved rows.

The rejected value remains NULL; it does not become a legitimate zero. Run the example and check that the zero input stays numeric zero while the invalid word is still visible as a missing converted value.

```sql run
SELECT tag,
       CASE
         WHEN TRIM(raw_value) ~ '^[0-9]+([.][0-9]+)?$'
           THEN TRIM(raw_value)::numeric
         ELSE NULL
       END AS deposit
FROM deposits
ORDER BY tag;
```
