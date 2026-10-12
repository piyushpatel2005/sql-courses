---
title: Reconcile two lists with FULL JOIN
slug: full-join
order: 5
language: sql
runtime: sql
lesson_type: interactive
summary: Compare two lists while retaining keys missing on either side.
seo_title: Reconcile two lists with FULL JOIN | Introduction to SQL
seo_description: Compare two lists while retaining keys missing on either side.
seo_keywords:
- SQL
- PostgreSQL
- full join
sql:
  seed: seed.sql
---

# Reconcile two lists with FULL JOIN

Sometimes neither side is the complete list. A FULL JOIN preserves matches plus unmatched rows from both inputs. This is useful for reconciling two independently collected lists.

The morning counter recorded tickets 1 and 2. The evening counter recorded 2 and 3. Matching on ticket makes one shared row for 2 and separate unmatched rows for 1 and 3. Each side gets a distinct output alias so missing values reveal which list lacks the ticket.

Run the comparison. NULL here describes a missing partner row, not a ticket whose identifier is unknown. `NULLS LAST` explicitly places the unmatched right-side row after rows with a left identifier.

Some databases lack FULL JOIN syntax. PostgreSQL supports it directly; elsewhere you may need a carefully designed union of matched and unmatched results. Do not replace it with CROSS JOIN, which generates all combinations rather than reconciling keys.

```sql run
SELECT a.ticket AS morning_ticket,
       b.ticket AS evening_ticket
FROM morning AS a
FULL JOIN evening AS b ON a.ticket = b.ticket
ORDER BY a.ticket NULLS LAST, b.ticket;
```
