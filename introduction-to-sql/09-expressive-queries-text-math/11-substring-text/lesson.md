---
title: Extract part of a value with SUBSTRING
slug: substring-text
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Extract characters using a one-based starting position.
seo_title: Extract part of a value with SUBSTRING | Introduction to SQL
seo_description: Extract characters using a one-based starting position.
seo_keywords:
- SQL
- PostgreSQL
- Extract part of a value with SUBSTRING
sql:
  seed: seed.sql
---

# Extract part of a value with SUBSTRING

SUBSTRING(text FROM start FOR count) extracts a section of text. Positions start at one. Spaces count as characters, so trimming first is a separate decision; this example intentionally uses the raw value.

The prefix starts at the raw value, including any leading spaces. Trimming first would change which characters occupy these positions.

```sql run
SELECT parcel_id,
       SUBSTRING(label
FROM 1 FOR 4) AS prefix
FROM parcels
ORDER BY parcel_id;
```
