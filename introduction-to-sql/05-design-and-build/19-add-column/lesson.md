---
title: Add a column with ALTER TABLE
slug: add-column
order: 19
language: sql
lesson_type: interactive
runtime: sql
summary: Add a field while preserving an existing table's rows.
seo_title: Add a column with ALTER TABLE | Introduction to SQL
seo_description: Add a field while preserving an existing table's rows.
seo_keywords:
- SQL
- PostgreSQL
- Add a column with ALTER TABLE
sql:
  seed: seed.sql
---

# Add a column with ALTER TABLE

ALTER TABLE changes an existing definition. ADD COLUMN gives each row another field without discarding its existing values. A default can supply the new value for old rows; NOT NULL states that the field is required.

The museum adds a reviewed flag. The demonstration uses ADD COLUMN IF NOT EXISTS so another Run leaves the same result. That guard only avoids adding the same name twice; it does not verify a pre-existing column type.

```sql run
ALTER TABLE labels ADD COLUMN IF NOT EXISTS reviewed boolean NOT NULL DEFAULT false;
SELECT label_id,
       title,
       reviewed
FROM labels
ORDER BY label_id;
```
