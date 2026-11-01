---
title: Keep application input separate from SQL structure
slug: application-boundaries
order: 15
language: sql
runtime: sql
lesson_type: informational
summary: Keep untrusted application values separate from SQL structure.
seo_title: Keep application input separate from SQL structure | Introduction to SQL
seo_description: Keep untrusted application values separate from SQL structure.
seo_keywords:
- SQL
- PostgreSQL
- application boundaries
---

# Keep application input separate from SQL structure

An application must preserve the difference between a query and the values supplied by its users. This reading explains that boundary; there is no application driver attached to the lesson editor.

## Data model

### Illustrative application data

#### `people`

One row represents one illustrative person record.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `name` · `text` | Display name returned by the parameterized lookup. | Illustrative nullable field; no constraint is specified in this reading. |
| `email` · `text` | Email value compared with the separately bound application parameter. | Illustrative nullable field; uniqueness is not specified. |

This is only the illustrative schema needed to read the parameter example, not the earlier project table or a runnable fixture. No key, foreign key or missing-value policy is promised. A real application must define those rules; equal emails could return more than one row unless uniqueness is enforced.

## Values are data, not SQL source

An application must not assemble SQL by concatenating an untrusted search term. A term containing quotes or SQL punctuation can change the meaning of a concatenated command. Escaping by hand is easy to get wrong.

Use your database driver's parameter-binding interface. In PostgreSQL, a query shape might be `SELECT name FROM people WHERE email = $1`. The application sends the email separately as a parameter value. `$1` is a placeholder, not quoted text and not a column name. This reading example is not runnable in the lesson editor because no separate application parameter is being supplied.

Prepared statements can reuse a query shape, but the important security boundary is separating SQL structure from bound values. Parameters generally stand for values, not identifiers such as a table name or ASC/DESC. If the application lets a user choose a sort column, map that choice to a small allowlist of known identifiers instead of inserting arbitrary input.
