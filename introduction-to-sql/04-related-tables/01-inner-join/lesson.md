---
title: Match related rows with INNER JOIN
slug: inner-join
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Attach a person's name to each matching booking.
seo_title: Match related rows with INNER JOIN | Introduction to SQL
seo_description: Attach a person's name to each matching booking.
seo_keywords:
- SQL
- PostgreSQL
- inner join
sql:
  seed: seed.sql
---

# Match related rows with INNER JOIN

A library stores member names once in `members`, while `loans` holds one row per loan. The shared member_id connects the facts. `JOIN ... ON` combines rows for which the matching condition is true; plain JOIN means INNER JOIN.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `loans`

One row represents one library borrowing record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `loan_id` · `integer` | Identifier of the loan. | Primary key. Required; cannot be `NULL`. |
| `member_id` · `integer` | Member identifier used to match the borrower in `members`. | Nullable; `NULL` means the identifier is unrecorded. |
| `title` · `text` | Title recorded for the borrowed book; not a separate book identifier. | Nullable; `NULL` means no title value is recorded. |

#### `members`

One row represents one library member.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `member_id` · `integer` | Identifier of the member. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Member display name; different members may share a name. | Nullable; `NULL` means no name value is recorded. |

### Relationship map

![Logical Key Match: loans.member_id and members.member_id](loans-member-id-to-members-member-id-relationship-0426e89d.svg)

`loans.member_id` matches `members.member_id`. One `members` row can have zero or many matching `loans` rows; each `loans` row can match zero or one parent because the parent key is unique. This is a logical match, not a declared foreign key; a NULL or unmatched child identifier is allowed.

Joining child detail repeats the parent fields once per matching child. An inner join omits unmatched rows; a left join keeps unmatched rows from its left input with NULLs for the missing side. Those result NULLs are separate from missing values stored in a real row.

Until now, every query took its facts from one table. Here `members.member_id` uniquely identifies a person; `loans.loan_id` identifies a borrowing record, and `loans.member_id` records who borrowed its `title`. One member can have many loans. The seed declares primary keys but does not declare a foreign-key constraint: our `ON` expression supplies the logical match. A later section will show how `REFERENCES` can enforce that relationship when data changes.

The aliases `m` and `l` are short names for tables within this query. A qualified name such as `m.name` says which table supplies a column. Qualifying identifiers is especially helpful when both tables contain member_id.

Asha appears twice because she has two loans. That is the correct one-to-many relationship, not a duplicate to erase. The joined result's grain is one row per loan. Members without loans disappear in an inner join.

Before running, predict the output row count from the matching keys. A unique member_id on the member side prevents each loan from matching several member rows. Joining on a nonunique display name could multiply rows incorrectly. The database will not infer the intended relationship just because two columns have similar names.

This matters when you reuse aggregates. After this join, Asha's member facts appear on two result rows. `COUNT(*)` would count three loan matches, not two distinct borrowers, and summing a member-level amount would repeat Asha's amount. Decide what one joined row means before counting or adding values; `DISTINCT` is not a general repair for a wrong join.


![One unique member matches two loan rows and therefore produces two joined result rows.](join-cardinality.svg)

```sql run
SELECT m.name, l.title
FROM members AS m
JOIN loans AS l ON l.member_id = m.member_id
ORDER BY l.loan_id;
```
