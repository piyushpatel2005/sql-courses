---
title: Create tables with purposeful data types
slug: create-types
order: 1
language: sql
runtime: sql
lesson_type: interactive
summary: Define an empty table with types chosen for its fields.
seo_title: Create tables with purposeful data types | Introduction to SQL
seo_description: Define an empty table with types chosen for its fields.
seo_keywords:
- SQL
- PostgreSQL
- create types
sql:
  seed: seed.sql
---

# Create tables with purposeful data types

Until now, each lesson has supplied its tables. `CREATE TABLE` defines one yourself. Between parentheses, each column needs a name and a type; commas separate definitions. This is data definition language, often shortened to DDL.

Choose types by meaning. `integer` stores whole numbers; `numeric(8,2)` stores exact decimal values with up to eight total digits, two after the decimal point. `text` stores variable-length text. `boolean` stores true or false, while `date` stores a calendar date without a time of day. A telephone number belongs in text because arithmetic on it makes no sense and leading zeroes may matter.

Run the demo. Its final SELECT returns an empty result with the new column headings. Creating a table does not create data rows. A later INSERT lesson adds records. `IF NOT EXISTS` makes this particular demo safe to run twice; it does not check that an existing table has the desired structure.

These lessons use PostgreSQL syntax. Type names and size rules vary across products. Avoid guessing that every database treats `text`, boolean, or auto-generated identifiers the same way.

```sql run
CREATE TABLE IF NOT EXISTS parcel_labels (
  label_id integer,
  destination text,
  weight numeric(8,2),
  fragile boolean,
  ship_date date
);
SELECT label_id, destination, weight, fragile, ship_date
FROM parcel_labels;
```
