---
title: Make an uppercase label with UPPER
slug: upper-text
order: 5
language: sql
lesson_type: interactive
runtime: sql
summary: Display a label in uppercase.
seo_title: Make an uppercase label with UPPER | Introduction to SQL
seo_description: Display a label in uppercase.
seo_keywords:
- SQL
- PostgreSQL
- Make an uppercase label with UPPER
sql:
  seed: seed.sql
---

# Make an uppercase label with UPPER

UPPER converts letters to uppercase. It changes the selected display value, not the table. Use it when a label convention calls for uppercase rather than treating uppercase as more correct data.

River Bowl becomes uppercase, but its spaces remain. Compare the transformed label with the seed before adding another cleaning function.

```sql run
SELECT parcel_id,
       UPPER(label) AS upper_label
FROM parcels
ORDER BY parcel_id;
```
