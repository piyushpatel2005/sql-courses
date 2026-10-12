---
title: Give a database account only the access it needs
slug: database-privileges
order: 16
language: sql
runtime: sql
lesson_type: informational
summary: Separate reporting access from permission to change database objects.
seo_title: Give a database account only the access it needs | Introduction to SQL
seo_description: Separate reporting access from permission to change database objects.
seo_keywords:
- SQL
- PostgreSQL
- database privileges
---

# Give a database account only the access it needs

A reporting account should be able to read its reports without also being able to drop their source tables. PostgreSQL roles own objects and receive privileges. GRANT assigns a permission; REVOKE removes a grant through that route. Membership in another role or a separate grant can still provide access, so review the whole permission path.

Keep application credentials separate from the account used for schema migrations. Test the reporting account's actual access, including operations it should not be allowed to perform. A view name alone is not a security policy.

This is a design reading, not a permissions exercise. The lesson database has no independent application login whose access you can meaningfully audit. Practice role and privilege changes on a separate server you own.
