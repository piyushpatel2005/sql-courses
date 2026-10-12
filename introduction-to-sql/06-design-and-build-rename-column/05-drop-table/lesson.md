---
title: Remove a table with DROP TABLE
slug: drop-table
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Remove an obsolete table without removing the live catalog.
seo_title: Remove a table with DROP TABLE | Introduction to SQL
seo_description: Remove an obsolete table without removing the live catalog.
seo_keywords:
- SQL
- PostgreSQL
- Remove a table with DROP TABLE
sql:
  seed: seed.sql
---

# Remove a table with DROP TABLE

DROP TABLE removes the whole table, including its rows and definition. It is not the same as deleting selected rows or dropping one field. IF EXISTS avoids an error when the table is already absent.

The demo removes an obsolete import table and then reads the separate live catalog. Dependencies can prevent a drop. Do not add CASCADE just to silence that error: it may remove objects you still need. The final result checker cannot independently establish that a table was dropped.

```sql run
DROP TABLE IF EXISTS old_import;
SELECT label
FROM current_labels
ORDER BY label;
```
