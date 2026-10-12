---
title: Supply an omitted value with DEFAULT
slug: column-defaults
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Choose the value used when an insert omits a column.
seo_title: Supply an omitted value with DEFAULT | Introduction to SQL
seo_description: Choose the value used when an insert omits a column.
seo_keywords:
- SQL
- PostgreSQL
- Supply an omitted value with DEFAULT
sql:
  seed: seed.sql
---

# Supply an omitted value with DEFAULT

DEFAULT supplies a value when an INSERT leaves that column out. It is not validation: an explicit value is still checked by the constraints. A supplied NULL remains NULL rather than invoking the default. The upcoming insertion lesson will use omitted columns.

The default does not add a row. It prepares a value for a later insert that omits capacity. Supplying an explicit zero would still fail the CHECK rule. IF NOT EXISTS allows another Run without recreating the table; it does not validate an existing definition.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY,
       capacity integer NOT NULL DEFAULT 1 CHECK (capacity > 0));
SELECT location_id,
       capacity
FROM locations;
```
