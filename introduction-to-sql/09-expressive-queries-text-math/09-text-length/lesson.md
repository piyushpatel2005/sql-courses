---
title: Count characters with CHAR_LENGTH
slug: text-length
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Count the characters in a raw label, including spaces.
seo_title: Count characters with CHAR_LENGTH | Introduction to SQL
seo_description: Count the characters in a raw label, including spaces.
seo_keywords:
- SQL
- PostgreSQL
- Count characters with CHAR_LENGTH
sql:
  seed: seed.sql
---

# Count characters with CHAR_LENGTH

CHAR_LENGTH counts characters in a text value, including spaces. It does not count words or reliably measure how much space a label will occupy on screen. A missing input returns NULL.

Surrounding spaces contribute to the character count. A label can look short on screen and still contain those characters.

```sql run
SELECT parcel_id,
       CHAR_LENGTH(label) AS characters
FROM parcels
ORDER BY parcel_id;
```
