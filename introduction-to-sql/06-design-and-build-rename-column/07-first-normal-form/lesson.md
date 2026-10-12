---
title: Avoid repeating groups in first normal form
slug: first-normal-form
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Represent each choice as a row instead of a repeating list.
seo_title: Avoid repeating groups in first normal form | Introduction to SQL
seo_description: Represent each choice as a row instead of a repeating list.
seo_keywords:
- SQL
- PostgreSQL
- Avoid repeating groups in first normal form
sql:
  seed: seed.sql
---

# Avoid repeating groups in first normal form

First normal form gives each field one value under the chosen data model and avoids numbered repeating groups such as book_1 and book_2. Store one selection per row instead of a comma-separated list. This lets a query address one relationship without parsing text.

The supplied selection table already follows this design. A reader who chooses another book gets another row, not another book column. Inspect the result with that possible addition in mind.

```sql run
SELECT reader,book
FROM selections
ORDER BY reader,book;
```
