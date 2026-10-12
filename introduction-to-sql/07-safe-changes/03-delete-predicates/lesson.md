---
title: Delete selected rows, not the table
slug: delete-predicates
order: 3
language: sql
runtime: sql
lesson_type: interactive
summary: Retire one record without dropping its table.
seo_title: Delete selected rows, not the table | Introduction to SQL
seo_description: Retire one record without dropping its table.
seo_keywords:
- SQL
- PostgreSQL
- delete predicates
sql:
  seed: seed.sql
---

# Delete selected rows, not the table

`DELETE FROM` removes rows matching its WHERE condition. The table, column definitions, and constraints remain. DROP TABLE instead removes the object itself. Neither command should be used casually on important data.

The cafe is retiring Cake, identified by item_id 3. A SELECT using that identifier would be a sensible preview. Run the deletion and inspect the remaining menu; deleting an already absent row later affects zero rows rather than inventing an error.

Omitting WHERE deletes every row. A foreign key may reject a deletion that would orphan a child, or may delete children too if ON DELETE CASCADE was chosen. The apparent scope of a DELETE therefore includes the schema's relationship policies, not just the visible WHERE clause.

The exercise keeps all unselected records. Its final SELECT catches an overly broad delete because missing rows change the expected result. It cannot prove that you used the requested predicate, so review your SQL as well as the output.

```sql run
DELETE FROM menu WHERE item_id = 3;
SELECT item_id, item FROM menu ORDER BY item_id;
```
