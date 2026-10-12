---
title: Separate facts that depend on part of a key
slug: partial-dependencies
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Store a person's description separately from their repeated assignments.
seo_title: Separate facts that depend on part of a key | Introduction to SQL
seo_description: Store a person's description separately from their repeated assignments.
seo_keywords:
- SQL
- PostgreSQL
- Separate facts that depend on part of a key
sql:
  seed: seed.sql
---

# Separate facts that depend on part of a key

Second normal form removes non-key facts that depend on only part of a composite key. In a reader-book choice, the reader name depends on reader_id, not on the reader-book pair. Store that name once in the reader table and use a join for the display.

The reader name can appear on several report rows even though it is stored once. If the name changes, the choices do not need separate corrections. The query reconstructs a display from those separate facts.

```sql run
SELECT r.name,c.book
FROM readers r
JOIN choices c ON c.reader_id=r.reader_id
ORDER BY r.reader_id,c.book;
```
