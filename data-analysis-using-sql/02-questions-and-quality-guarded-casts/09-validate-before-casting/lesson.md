---
title: Test decimal text with a regular expression
slug: validate-before-casting
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Check whether fee text follows a stated decimal policy.
seo_title: Test decimal text with a regular expression | Data Analysis Using SQL
seo_description: Check whether fee text follows a stated decimal policy.
seo_keywords:
- SQL
- PostgreSQL
- Test decimal text with a regular expression
sql:
  seed: seed.sql
---

# Test decimal text with a regular expression

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

Region cleanup changed labels; fees need a stricter decision before we can do arithmetic. In this separate `deposits` demo, each row is one tagged deposit record. `tag` is its integer identifier, and `raw_value` is text intended to contain a USD amount, not yet a number.

The `~` operator asks whether text matches a regular expression. In `^[0-9]+([.][0-9]+)?$`, `^` and `$` anchor the whole value, `[0-9]` matches one digit, and `+` requires one or more of the preceding item. Parentheses group the decimal suffix, `[.]` matches a literal dot, and `?` makes that entire suffix optional. This policy accepts nonnegative decimal text, not currency symbols, signs or scientific notation.

TRIM removes surrounding spaces before the test. A successful pattern match is a validation decision, not a numeric conversion. Run the checks and distinguish the known zero from the word nope. NULL input yields an unknown boolean result.

```sql run
SELECT tag,
       TRIM(raw_value) ~ '^[0-9]+([.][0-9]+)?$' AS approved
FROM deposits
ORDER BY tag;
```
