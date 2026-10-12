---
title: Accept either condition with OR
slug: or-conditions
order: 13
language: sql
lesson_type: interactive
runtime: sql
summary: Accept either category while keeping an availability requirement.
seo_title: Accept either condition with OR | Introduction to SQL
seo_description: Accept either category while keeping an availability requirement.
seo_keywords:
- SQL
- PostgreSQL
- Accept either condition with OR
sql:
  seed: seed.sql
---

# Accept either condition with OR

OR keeps a row when either condition is true. It does not create two copies when both conditions match. The cafe query accepts items that are cheap or belong to the food section.

When combining OR with an already learned AND condition, use parentheses for the alternatives. `in_stock AND (section = 'food' OR section = 'drink')` applies stock availability to both sections. AND binds more tightly than OR without those parentheses. Read the grouped condition aloud before relying on its output.

```sql run
SELECT item
FROM menu
WHERE price < 3 OR section = 'food'
ORDER BY item_id;
```
