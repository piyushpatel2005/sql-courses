---
title: Generate a small schedule with CROSS JOIN
slug: cross-join
order: 9
language: sql
runtime: sql
lesson_type: interactive
summary: Generate every bench-and-shift combination.
seo_title: Generate a small schedule with CROSS JOIN | Introduction to SQL
seo_description: Generate every bench-and-shift combination.
seo_keywords:
- SQL
- PostgreSQL
- cross join
sql:
  seed: seed.sql
---

# Generate a small schedule with CROSS JOIN

A booking system sometimes needs rows that do not exist yet: every possible combination of a location and a time. CROSS JOIN builds those combinations. Each row on the left pairs with every row on the right, regardless of value.

The demo has two rooms and two slots, so it returns four rows. The result's grain is one room-slot combination. If one input were empty, the result would be empty too. Adding a WHERE after CROSS JOIN can reject impossible combinations, but the underlying question is still about pairs.

Run the schedule and read each room's two slots. Ordinary matching joins should state their relationship in ON; use CROSS JOIN when you deliberately want this multiplication. Before cross joining large inputs, estimate the size. A hundred rooms and a thousand slots already make a hundred thousand rows.

```sql run
SELECT r.room, s.slot
FROM rooms AS r
CROSS JOIN slots AS s
ORDER BY r.room, s.slot;
```
