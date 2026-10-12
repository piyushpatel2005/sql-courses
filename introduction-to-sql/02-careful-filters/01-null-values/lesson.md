---
title: Recognize missing values with IS NULL
slug: null-values
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Find missing notes without confusing NULL with an empty string.
seo_title: Recognize missing values with IS NULL | Introduction to SQL
seo_description: Find missing notes without confusing NULL with an empty string.
seo_keywords:
- SQL
- PostgreSQL
- null values
sql:
  seed: seed.sql
---

# Recognize missing values with IS NULL

The absence of a cafe note is stored as `NULL`. It is not an empty string, zero, or the word 'NULL'. It means there is no known value in that field. The application must decide whether that means unknown, unrecorded, or not applicable.

Ordinary comparisons with NULL produce unknown. Even `note = NULL` is not true for a missing note. WHERE keeps only true rows, so use `IS NULL` to find missing values and `IS NOT NULL` to find recorded ones.

This also affects negation. `NOT (note = 'urgent')` does not include missing notes, because NOT unknown is still unknown. If missing notes should count, write that rule explicitly with `OR note IS NULL`.

Run the example. Tea and Cake have no note. Their menu rows still exist; only one field is missing. Later, COALESCE will let us choose display text for these missing fields without pretending the source was complete.

```sql run
SELECT item
FROM menu
WHERE note IS NULL
ORDER BY item_id;
```
