---
title: Display a fallback with COALESCE
slug: coalesce-fallbacks
order: 19
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label for missing notes without changing the source.
seo_title: Display a fallback with COALESCE | Introduction to SQL
seo_description: Display a label for missing notes without changing the source.
seo_keywords:
- SQL
- PostgreSQL
- Display a fallback with COALESCE
sql:
  seed: seed.sql
---

# Display a fallback with COALESCE

COALESCE returns the first non-NULL argument. It lets a report display a helpful label when a value is missing without changing the stored source. An empty string is not NULL and therefore does not invoke the fallback.

The cafe uses No note for missing handling notes. Existing notes remain visible. Choose a fallback that means what the source supports: substituting zero for unknown money would change a metric rather than simply improve its label. Arguments must have compatible types.

```sql run
SELECT item,
       COALESCE(note,
       'No note') AS display_note
FROM menu
ORDER BY item_id;
```
