---
title: Keep unmatched rows with LEFT JOIN
slug: left-join
order: 3
language: sql
runtime: sql
lesson_type: interactive
summary: Keep people whose related booking is missing.
seo_title: Keep unmatched rows with LEFT JOIN | Introduction to SQL
seo_description: Keep people whose related booking is missing.
seo_keywords:
- SQL
- PostgreSQL
- left join
sql:
  seed: seed.sql
---

# Keep unmatched rows with LEFT JOIN

The library needs a list of members who have never borrowed. Starting from members and using LEFT JOIN preserves every member. A matching loan supplies its values; an unmatched member receives NULL in the loan columns.

The example retains Cleo with a missing title. Asha still appears twice: an outer join preserves unmatched rows but does not collapse multiple matches. A RIGHT JOIN preserves the right side instead; swapping table order and using LEFT JOIN often makes the question easier to read.

To find only unmatched members, test `l.loan_id IS NULL` after the join. Use a column that cannot be NULL on a real matched row, such as a primary key. Testing an optional title would confuse a missing title with a missing loan.

Be careful with filters on the optional side. `WHERE l.title = 'Maps'` removes NULL-extended rows and loses unmatched members. Put that condition in ON when you mean 'keep all members, but attach only matching Maps loans'.

```sql run
SELECT m.name, l.title
FROM members AS m
LEFT JOIN loans AS l ON l.member_id = m.member_id
ORDER BY m.member_id, l.loan_id;
```
