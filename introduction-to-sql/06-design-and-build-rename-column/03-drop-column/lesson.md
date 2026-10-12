---
title: Remove one column with DROP COLUMN
slug: drop-column
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Remove a temporary field while keeping the rest of the table.
seo_title: Remove one column with DROP COLUMN | Introduction to SQL
seo_description: Remove a temporary field while keeping the rest of the table.
seo_keywords:
- SQL
- PostgreSQL
- Remove one column with DROP COLUMN
sql:
  seed: seed.sql
---

# Remove one column with DROP COLUMN

ALTER TABLE ... DROP COLUMN removes a field and the values stored in it while keeping other columns and rows. This loses data. Inspect dependencies and preserve important information before changing a real schema.

The museum no longer needs its temporary review note. IF EXISTS makes the demonstration safe to repeat after the column is gone. A final SELECT shows that the identifier and title still exist.

```sql run
ALTER TABLE labels DROP COLUMN IF EXISTS scratch_note;
SELECT label_id,
       title
FROM labels;
```
