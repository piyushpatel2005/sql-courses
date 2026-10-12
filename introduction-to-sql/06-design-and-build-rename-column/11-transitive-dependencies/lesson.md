---
title: Separate indirectly dependent facts
slug: transitive-dependencies
order: 11
language: sql
lesson_type: interactive
runtime: sql
summary: Keep room details separate from workshops that use the room.
seo_title: Separate indirectly dependent facts | Introduction to SQL
seo_description: Keep room details separate from workshops that use the room.
seo_keywords:
- SQL
- PostgreSQL
- Separate indirectly dependent facts
sql:
  seed: seed.sql
---

# Separate indirectly dependent facts

Third normal form removes non-key facts that depend on another non-key fact rather than directly on the row identity. A workshop venue determines its address. Repeating that address on every workshop invites contradictory copies when the venue moves. Keep the venue facts together and join them for a report.

The query joins each session to its venue. A new venue address would then reach every affected session report through that one relationship. These dependencies come from the business model, not just from column names.

```sql run
SELECT s.title,v.address
FROM sessions s
JOIN venues v ON v.venue_id=s.venue_id
ORDER BY s.session_id;
```
