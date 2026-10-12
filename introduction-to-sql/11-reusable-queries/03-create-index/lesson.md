---
title: Create an index without changing a result
slug: create-index
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Declare an index while preserving the meaning of a lookup.
seo_title: Create an index without changing a result | Introduction to SQL
seo_description: Declare an index while preserving the meaning of a lookup.
seo_keywords:
- SQL
- PostgreSQL
- Create an index without changing a result
sql:
  seed: seed.sql
---

# Create an index without changing a result

An index is an additional structure that can help PostgreSQL locate rows. CREATE INDEX ... ON table(column) creates a common B-tree index. It costs storage and write maintenance, so adding indexes everywhere is not a good default. Primary and unique keys already have supporting indexes.

The cafe creates a section index and runs its usual lookup. Its rows and order must not change. IF NOT EXISTS makes this demo repeatable. Submit checks the result, not whether the index exists or makes the query faster; inspect the declaration as well.

```sql run
CREATE INDEX IF NOT EXISTS menu_section_idx ON menu(section);
SELECT item
FROM menu
WHERE section = 'drink'
ORDER BY item_id;
```
