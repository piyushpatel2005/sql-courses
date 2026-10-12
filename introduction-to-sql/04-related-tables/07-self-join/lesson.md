---
title: Read one table in two roles with a self join
slug: self-join
order: 7
language: sql
runtime: sql
lesson_type: interactive
summary: Read one table as both person and mentor.
seo_title: Read one table in two roles with a self join | Introduction to SQL
seo_description: Read one table as both person and mentor.
seo_keywords:
- SQL
- PostgreSQL
- self cross joins
sql:
  seed: seed.sql
---

# Read one table in two roles with a self join

A self join reads the same table in two roles. Here `person` is the employee and `lead` is that person's manager. These are query aliases, not separate stored copies. The relationship still needs an ON condition.

The top-level manager has no manager_id. LEFT JOIN, which you have already practiced, keeps that person with a NULL manager name. The manager-side staff_id is unique, so every employee can match at most one manager row. Run the directory and follow one employee's manager_id to the matching key.

```sql run
SELECT person.name, lead.name AS manager
FROM staff AS person
LEFT JOIN staff AS lead
  ON person.manager_id = lead.staff_id
ORDER BY person.staff_id;
```
