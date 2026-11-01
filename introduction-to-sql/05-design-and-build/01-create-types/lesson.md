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

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `parcel_labels`

One row represents one parcel label to be created.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `label_id` · `integer` | Intended identifier of the parcel label. | Nullable; `NULL` means the identifier is unrecorded. |
| `destination` · `text` | Destination text for the parcel. | Nullable; `NULL` means no destination value is recorded. |
| `weight` · `numeric(8,2)` | Parcel mass in kilograms, stored to two decimal places. | Nullable; `NULL` means the weight is unrecorded, not zero. |
| `fragile` · `boolean` | Fragility flag: true for fragile, false otherwise. | Nullable; `NULL` means fragility is unrecorded. |
| `ship_date` · `date` | Shipping calendar date, without time of day or time zone. | Nullable; `NULL` means no ship date value is recorded. |

This first design declares no primary key or positivity checks. A missing fragile flag means the flag is unknown, not false.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

For the parcel-label example, one future row will describe one parcel: its identifier, destination, weight in kilograms, fragile flag, and shipping date. Defining those fields decides which kinds of facts the table can hold. It does not yet require an identifier to be unique or a weight to be positive; the next lessons add those rules.

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
