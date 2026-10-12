---
title: Make unmatched records visible
slug: keep-unmatched-records
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Attach region labels without losing paid orders whose member is missing.
seo_title: Make unmatched records visible | Data Analysis Using SQL
seo_description: Attach region labels without losing paid orders whose member is missing.
seo_keywords:
- SQL analysis
- keep unmatched records
- PostgreSQL
sql:
  seed: seed.sql
---

# Make unmatched records visible

A join can silently remove real activity. Decide whether unmatched orders should be excluded, retained, or investigated before reporting a regional total.

An inner join returns matching pairs. A left join retains every left row and fills right-side columns with null when no match exists. A right-side condition in `WHERE` can remove those null-extended rows and accidentally undo that retention. Put eligibility conditions in `ON` when they should limit matches without removing the left population.

Use aliases to distinguish keys, such as `o.member_id` and `m.member_id`. A null right-side primary key after a left join is a reliable missing-match signal because an actual primary key cannot be null. Displaying an unknown region is a reporting policy; it does not repair the missing member record.

## Read and run

A parcel desk has a dispatch whose route is absent from the route directory.

```sql run
SELECT d.parcel, COALESCE(r.name, 'unmatched') AS route_name
FROM dispatches d
LEFT JOIN routes r ON r.route = d.route
ORDER BY d.parcel;
```

Both parcels remain. The unmatched label tells the reader why the second route is unavailable rather than making that dispatch disappear.

Adding route 9 to the directory would replace the unmatched label, not add another dispatch. The parcel keys should remain the same.
