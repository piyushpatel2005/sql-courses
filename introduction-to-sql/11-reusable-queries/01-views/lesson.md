---
title: Name a reusable query with a view
slug: views
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Give a recurring filter a reusable query name.
seo_title: Name a reusable query with a view | Introduction to SQL
seo_description: Give a recurring filter a reusable query name.
seo_keywords:
- SQL
- PostgreSQL
- views
sql:
  seed: seed.sql
---

# Name a reusable query with a view

A view is a stored query definition that can be selected like a table. The cafe often needs its in-stock menu, so `CREATE VIEW` gives that filter a name. Selecting the view runs its definition against the underlying data; an ordinary view is not a separate stored snapshot.

Run the demo. `CREATE OR REPLACE VIEW` allows repeated runs with this compatible definition. The final SELECT names the output order explicitly. Do not depend on a view definition's internal order when the outer query needs a stable report.

A view can simplify repeated SQL and expose selected columns, but security depends on its permissions and definition, not merely on its name. A materialized view is a different object that stores results and needs refreshing; we do not create one here.

When designing a view, choose a clear grain and stable column names. A narrow view that answers one recurring question is easier to use than a hidden maze of nested definitions. The exercise view has one row per available gear item.

```sql run
CREATE OR REPLACE VIEW ready_menu AS
SELECT item_id, item, price
FROM menu WHERE in_stock = true;
SELECT item, price FROM ready_menu ORDER BY item_id;
```
