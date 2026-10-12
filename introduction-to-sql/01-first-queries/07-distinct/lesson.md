---
title: Remove duplicate result rows
slug: distinct
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Build a category list without repeated result rows.
seo_title: Remove duplicate result rows | Introduction to SQL
seo_description: Build a category list without repeated result rows.
seo_keywords:
- SQL
- PostgreSQL
- distinct
sql:
  seed: seed.sql
---

# Remove duplicate result rows

The cafe sells several food items, but its navigation menu needs each section only once. `DISTINCT` removes duplicate rows from the selected result. It does not delete duplicates from the source table.

The word appears directly after `SELECT`. With one selected column, duplicate means the same value in that column. With two selected columns, SQL compares the whole pair. Selecting `section, item` would preserve both Soup and Cake because those pairs differ.

Run the example and look for two rows, `drink` and `food`. Sorting by the selected section makes their display predictable. Do not use DISTINCT just to hide unexpected duplicates after a join; first understand why the join produced those rows. We will return to that distinction when tables are combined.

```sql run
SELECT DISTINCT section
FROM menu
ORDER BY section;
```
