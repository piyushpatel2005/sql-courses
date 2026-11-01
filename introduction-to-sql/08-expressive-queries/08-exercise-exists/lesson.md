---
title: 'Exercise: makers who have bookings'
slug: exercise-exists
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Find people with related activity without multiplying contacts.
seo_title: 'Exercise: makers who have bookings | Introduction to SQL'
seo_description: Find people with related activity without multiplying contacts.
seo_keywords:
- SQL
- PostgreSQL
- exercise exists
hints:
- Correlate the inner key with the current outer person.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Inez
  - - Jules
---

# Exercise: makers who have bookings

The makerspace needs one contact row for each maker with a booking, not one row per booking. EXISTS fits that question without producing duplicate contacts. Kai has no bookings and should not appear.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `bookings`

One row represents one booked session choice.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `booking_id` · `integer` | Identifier of this booking, not of a person. | Primary key. Required; cannot be `NULL`. |
| `maker_id` · `integer` | Person identifier used to match this booking to `makers`. | Nullable; `NULL` means the identifier is unrecorded. |
| `session` · `text` | Booked session label; not a separate session identifier. | Nullable; `NULL` means no session value is recorded. |

#### `makers`

One row represents one person in the makerspace.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `maker_id` · `integer` | Identifier of the person. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Person display name; different people may share a name. | Nullable; `NULL` means no name value is recorded. |

### Relationship map

![Logical Key Match: bookings.maker_id and makers.maker_id](bookings-maker-id-to-makers-maker-id-relationship-d09e3375.svg)

`bookings.maker_id` matches `makers.maker_id`. One `makers` row can have zero or many matching `bookings` rows; each `bookings` row can match zero or one parent because the parent key is unique. This is a logical match, not a declared foreign key; a NULL or unmatched child identifier is allowed.

`EXISTS` tests for a matching child without copying child rows into the output, so multiple matches do not multiply a parent row.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE makers (maker_id integer PRIMARY KEY, name text);
CREATE TABLE bookings (booking_id integer PRIMARY KEY, maker_id integer, session text);
INSERT INTO makers VALUES (1,'Inez'),(2,'Jules'),(3,'Kai');
INSERT INTO bookings VALUES (21,1,'Woodwork'),(22,1,'Repair'),(23,2,'Printing');
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return maker name once per maker who has at least one booking. Use correlated EXISTS and order by maker_id.

## Result to aim for

| name |
| --- |
| Inez |
| Jules |
