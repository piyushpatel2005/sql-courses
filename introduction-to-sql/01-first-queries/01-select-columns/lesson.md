---
title: Read rows with SELECT
slug: select-columns
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Choose the columns a reader needs without changing the stored table.
seo_title: Read rows with SELECT | Introduction to SQL
seo_description: Choose the columns a reader needs without changing the stored table.
seo_keywords:
- SQL
- PostgreSQL
- select columns
sql:
  seed: seed.sql
---

# Read rows with SELECT

A database stores related facts in tables. A table has named columns and rows; one row in this cafe's `menu` describes one item. The column names are part of the schema, which describes the table's structure. The stored values are its data.

SQL is a language for requesting or changing those facts. You describe the result you want rather than writing a loop over rows. `SELECT item, price` chooses two output columns. `FROM menu` identifies the input table. A comma separates columns, and a semicolon ends the statement.

SQL keywords are case-insensitive; uppercase keywords make them easier to spot beside column names. A line beginning with `--` is a comment for the reader, so it does not execute. When you see comments in an exercise starter, replace or keep them as useful notes rather than treating them as missing commands.

This first example includes `ORDER BY item_id` so the rows have a dependable order. It means ascending item number; a later lesson explores sorting. Without an `ORDER BY`, SQL does not promise the insertion order.

Use the Run button below. The result has the headers `item` and `price`, with Tea first. `SELECT *` is useful for inspecting a small unfamiliar table, but naming columns makes a report's contract clearer. Selecting data does not change the table.

In the exercises, edit `script.sql`, Run to inspect the result, then Submit. Each attempt starts with the lesson's supplied tables. Submit checks the final result, not whether you wrote one particular spelling of the query.

```sql run
SELECT item, price
FROM menu
ORDER BY item_id;
```
