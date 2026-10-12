---
title: Require a matching parent with a foreign key
slug: foreign-keys
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Require a child row to refer to an existing parent key.
seo_title: Require a matching parent with a foreign key | Introduction to SQL
seo_description: Require a child row to refer to an existing parent key.
seo_keywords:
- SQL
- PostgreSQL
- Require a matching parent with a foreign key
sql:
  seed: seed.sql
---

# Require a matching parent with a foreign key

A foreign key protects a relationship when data changes. REFERENCES locations(location_id) requires a non-NULL child value to match an existing parent key. Create the parent before its child.

NOT NULL is a separate rule: it makes that relationship mandatory. ON DELETE RESTRICT prevents removing a referenced parent. The empty SELECT below is only a display checkpoint, not proof of enforcement; review the declaration even when the output matches. A join reads related rows but does not create this protection.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY);
CREATE TABLE IF NOT EXISTS shelves (shelf_id integer PRIMARY KEY,
       location_id integer NOT NULL REFERENCES locations(location_id) ON DELETE RESTRICT);
SELECT shelf_id,location_id
FROM shelves;
```
