---
title: Insert rows with an explicit column list
slug: insert-values
order: 17
language: sql
runtime: sql
lesson_type: interactive
summary: Add records using an explicit destination column list.
seo_title: Insert rows with an explicit column list | Introduction to SQL
seo_description: Add records using an explicit destination column list.
seo_keywords:
- SQL
- PostgreSQL
- insert values
sql:
  seed: seed.sql
---

# Insert rows with an explicit column list

`INSERT INTO` adds data to a table. Name the destination columns, then provide a VALUES tuple in that same order. A second tuple adds another row in the same statement. This is data manipulation language, or DML.

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `labels`

One row represents one museum label.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label_id` · `integer` | Identifier of the label record. | Primary key. Required; cannot be `NULL`. |
| `title` · `text` | Title printed on the museum label. | Required; cannot be `NULL`. |
| `reviewed` · `boolean` | Review flag: true means reviewed; false means not reviewed. | Required; cannot be `NULL`. Default `false` when omitted. |

The example writes two museum labels. Single quotes delimit text; an apostrophe inside text is doubled, as in `'Maker''s mark'`. Numbers and booleans are not quoted. A column omitted from the list receives its default, or NULL if no default exists and the column permits it.

The demo clears its own disposable table with DROP TABLE IF EXISTS, then recreates it so another Run cannot duplicate its primary keys. DROP removes the whole table; the upcoming schema-change lessons distinguish removing a table from changing one. This cleanup is only for this tiny demonstration, not advice for a production import.

Run the insert and inspect the final SELECT. Earlier statements change the table, while the final statement decides what the output panel shows.

```sql run
DROP TABLE IF EXISTS labels;
CREATE TABLE labels (
  label_id integer PRIMARY KEY,
  title text NOT NULL,
  reviewed boolean NOT NULL DEFAULT false
);
INSERT INTO labels (label_id, title)
VALUES (1, 'Maker''s mark'), (2, 'River bowl');
SELECT label_id, title, reviewed
FROM labels ORDER BY label_id;
```
