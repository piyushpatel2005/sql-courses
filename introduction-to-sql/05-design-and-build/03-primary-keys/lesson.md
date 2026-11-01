---
title: Identify a row with PRIMARY KEY
slug: primary-keys
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Give each stored row a unique, required identifier.
seo_title: Identify a row with PRIMARY KEY | Introduction to SQL
seo_description: Give each stored row a unique, required identifier.
seo_keywords:
- SQL
- PostgreSQL
- Identify a row with PRIMARY KEY
sql:
  seed: seed.sql
---

# Identify a row with PRIMARY KEY

A primary key gives each row a unique, non-NULL identity. It can be used by another table to refer to that row. A display name is often a poor identifier because names can repeat or change.

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `locations`

One row represents one location.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `location_id` · `integer` | Identifier of the location. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Location display name. | Nullable; `NULL` means no name value is recorded. |

The empty result confirms the column names, not the identity rule. Read the PRIMARY KEY declaration as well: it will reject both a missing identifier and a repeated identifier when rows are inserted. IF NOT EXISTS allows another Run without recreating the table; it does not validate an existing definition.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY,
       name text);
SELECT location_id,
       name
FROM locations;
```
