---
title: 'Exercise: Require a matching parent with a foreign key'
slug: exercise-foreign-keys
order: 14
language: sql
lesson_type: coding
runtime: sql
summary: Require a child row to refer to an existing parent key.
seo_title: 'Exercise: Require a matching parent with a foreign key | Introduction to SQL'
seo_description: Require a child row to refer to an existing parent key.
seo_keywords:
  - SQL
  - PostgreSQL
  - Require a matching parent with a foreign key
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - shelf_id
    - room_id
  expected_row_count: 0
  expected_rows: []
hints:
  - Create the child with REFERENCES to the supplied parent table.
---

# Exercise: Require a matching parent with a foreign key

Every shelf must belong to an existing room. The rooms table is supplied; create only its child.

## Your Task

1. Create shelves with shelf_id integer PRIMARY KEY and room_id integer NOT NULL REFERENCES rooms(room_id) ON DELETE RESTRICT. Select shelf_id and room_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
