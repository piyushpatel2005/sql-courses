---
title: Choose a result value with CASE
slug: case-values
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Turn a validation result into a review decision.
seo_title: Choose a result value with CASE | Data Analysis Using SQL
seo_description: Turn a validation result into a review decision.
seo_keywords:
- SQL
- PostgreSQL
- Choose a result value with CASE
sql:
  seed: seed.sql
---

# Choose a result value with CASE

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

CASE WHEN condition THEN value ELSE value END chooses the first branch whose condition is true. ELSE handles other rows, including an unknown condition. The branches must have compatible types.

Here the validation rule is already familiar. CASE turns its result into a review label without converting the fee. A known zero still receives approved; a blank needs review. The next lesson will use this branch choice to guard a conversion that could otherwise fail.

```sql run
SELECT tag,
       CASE
         WHEN TRIM(raw_value) ~ '^[0-9]+([.][0-9]+)?$'
           THEN 'approved'
         ELSE 'review'
       END AS status
FROM deposits
ORDER BY tag;
```
