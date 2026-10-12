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

The ~ operator asks whether text matches a regular expression. In `^[0-9]+([.][0-9]+)?$`, ^ and $ anchor the whole value, + means one or more digits, and the final group is optional. This policy accepts nonnegative decimal text, not currency symbols, signs or scientific notation.

TRIM removes surrounding spaces before the test. A successful pattern match is a validation decision, not a numeric conversion. Run the checks and distinguish the known zero from the word nope. NULL input yields an unknown boolean result.

```sql run
SELECT tag,
       TRIM(raw_value) ~ '^[0-9]+([.][0-9]+)?$' AS approved
FROM deposits
ORDER BY tag;
```
