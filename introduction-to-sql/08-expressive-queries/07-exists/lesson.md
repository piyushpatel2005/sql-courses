---
title: Ask whether a related row exists
slug: exists
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Find people with related activity without multiplying contacts.
seo_title: Ask whether a related row exists | Introduction to SQL
seo_description: Find people with related activity without multiplying contacts.
seo_keywords:
- SQL
- PostgreSQL
- exists
sql:
  seed: seed.sql
---

# Ask whether a related row exists

A library wants each member who has at least one loan, regardless of how many. EXISTS tests whether its subquery returns any rows. It does not attach those rows to the output, so members do not multiply when they have several loans.

The subquery refers to `m.member_id` from the outer query. That makes it correlated: for the member being considered, it asks whether a matching loan exists. `SELECT 1` is conventional here because the selected value is irrelevant; only the presence of a row matters.

Run the example and expect Asha and Bo once each. NOT EXISTS answers the opposite question and would return Cleo. Unlike a careless NOT IN query, a NULL somewhere in the inner key column does not poison the whole absence test; the equality simply fails to find a match for that row.

The correlation predicate is essential. Without `l.member_id = m.member_id`, one loan anywhere would make EXISTS true for every member. This is a logic mistake, not a syntax error, so test both a member with loans and one without.

```sql run
SELECT m.name
FROM members AS m
WHERE EXISTS (
  SELECT 1 FROM loans AS l
  WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;
```
