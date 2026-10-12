---
title: Prevent repeated known values with UNIQUE
slug: unique-values
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Reject repeated labels while keeping a separate row identifier.
seo_title: Prevent repeated known values with UNIQUE | Introduction to SQL
seo_description: Reject repeated labels while keeping a separate row identifier.
seo_keywords:
- SQL
- PostgreSQL
- Prevent repeated known values with UNIQUE
sql:
  seed: seed.sql
---

# Prevent repeated known values with UNIQUE

UNIQUE rejects repeated known values. PostgreSQL ordinary UNIQUE still permits more than one NULL, so combine it with the previously taught NOT NULL when a required value must also be unique. An email policy should be a business decision rather than an assumption about every person.

A repeated known location name would now be rejected. The primary key protects location_id; the new UNIQUE rule protects a different business value. IF NOT EXISTS allows another Run without recreating the table; it does not validate an existing definition.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY,
       name text NOT NULL UNIQUE);
SELECT location_id,
       name
FROM locations;
```
