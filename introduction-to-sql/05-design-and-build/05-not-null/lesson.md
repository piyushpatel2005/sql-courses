---
title: Require a value with NOT NULL
slug: not-null
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Require a recorded value in a column.
seo_title: Require a value with NOT NULL | Introduction to SQL
seo_description: Require a recorded value in a column.
seo_keywords:
- SQL
- PostgreSQL
- Require a value with NOT NULL
sql:
  seed: seed.sql
---

# Require a value with NOT NULL

NOT NULL rejects a row when the named field has no value. It does not require text to be nonempty, positive, or unique; those are different rules. Use it when the business fact must be recorded.

The location name is required, while its identity is already protected by the primary key. An empty string would still satisfy NOT NULL; this lesson does not add a nonblank-text rule. IF NOT EXISTS allows another Run without recreating the table; it does not validate an existing definition.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY,
       name text NOT NULL);
SELECT location_id,
       name
FROM locations;
```
