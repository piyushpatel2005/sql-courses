---
title: Find text with LIKE
slug: like-patterns
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Find a text pattern rather than a fixed list of names.
seo_title: Find text with LIKE | Introduction to SQL
seo_description: Find a text pattern rather than a fixed list of names.
seo_keywords:
- SQL
- PostgreSQL
- like patterns
sql:
  seed: seed.sql
---

# Find text with LIKE

A text search need not require an exact word. `LIKE 'C%'` means the value begins with uppercase C and then has zero or more characters. `%` is the multi-character wildcard; `_` matches exactly one character. The pattern applies to the whole value, so `'%C%'` instead looks anywhere within it.

Run the cafe search. Cake and Coffee qualify. Plain LIKE is case-sensitive for these ordinary PostgreSQL text values. PostgreSQL also offers `ILIKE` for case-insensitive matching; other databases often use a different collation or function strategy, so do not assume ILIKE is portable.

A literal percent sign needs escaping rather than acting as a wildcard. For example, `LIKE '%!%%' ESCAPE '!'` searches for a percent sign anywhere. We use the explicit escape character to keep that meaning visible.

The exercise searches for a space, not a particular gear name. Put `%` on both sides so the space can occur anywhere.

```sql run
SELECT item
FROM menu
WHERE item LIKE 'C%'
ORDER BY item_id;
```
