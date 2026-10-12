---
title: Rename a column without replacing its values
slug: rename-column
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Change a column's name without replacing its stored values.
seo_title: Rename a column without replacing its values | Introduction to SQL
seo_description: Change a column's name without replacing its stored values.
seo_keywords:
- SQL
- PostgreSQL
- Rename a column without replacing its values
sql:
  seed: seed.sql
---

# Rename a column without replacing its values

ALTER TABLE ... RENAME COLUMN ... TO ... changes a field name, not the data in it. Queries using the old name must be updated. Check dependent code before renaming a production column.

This disposable demo recreates its own table before each Run so the old name is present. DROP removes that demo table; a dedicated lesson shortly explains removal. The rename is the operation to inspect here.

```sql run
DROP TABLE IF EXISTS rename_demo;
CREATE TABLE rename_demo (id integer,
       title text);
INSERT INTO rename_demo
VALUES (1,'Stone cup');
ALTER TABLE rename_demo RENAME COLUMN title TO label;
SELECT id,
       label
FROM rename_demo;
```
