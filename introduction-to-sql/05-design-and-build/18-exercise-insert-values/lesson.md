---
title: 'Exercise: register two tool kits'
slug: exercise-insert-values
order: 18
language: sql
runtime: sql
lesson_type: coding
summary: Add records using an explicit destination column list.
seo_title: 'Exercise: register two tool kits | Introduction to SQL'
seo_description: Add records using an explicit destination column list.
seo_keywords:
- SQL
- PostgreSQL
- exercise insert values
hints:
- Each VALUES tuple must follow the order of the listed columns.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - kit_id
  - name
  - pieces
  expected_row_count: 2
  expected_rows:
  - - 10
    - Mending
    - 4
  - - 20
    - Sketching
    - 6
---

# Exercise: register two tool kits

The kits table is ready but empty. Add two records with explicit identifiers and piece counts. Naming the destination columns makes it clear how each tuple maps to the table, even if the table later gains another column.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE kits (kit_id integer PRIMARY KEY, name text NOT NULL, pieces integer NOT NULL DEFAULT 1 CHECK (pieces > 0));
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Insert kit 10 named 'Mending' with 4 pieces and kit 20 named 'Sketching' with 6 pieces into kits. Return kit_id, name, pieces ordered by kit_id.

## Result to aim for

| kit_id | name | pieces |
| --- | --- | --- |
| 10 | Mending | 4 |
| 20 | Sketching | 6 |
