---
title: 'Exercise: who booked each session'
slug: exercise-inner-join
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Attach a person's name to each matching booking.
seo_title: 'Exercise: who booked each session | Introduction to SQL'
seo_description: Attach a person's name to each matching booking.
seo_keywords:
- SQL
- PostgreSQL
- exercise inner join
hints:
- Match the foreign identifier to the person's unique key.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - session
  expected_row_count: 3
  expected_rows:
  - - Inez
    - Woodwork
  - - Inez
    - Repair
  - - Jules
    - Printing
---

# Exercise: who booked each session

A makerspace keeps people in makers and their session choices in bookings. Join the identifiers so each booking gains a readable name. Inez should appear twice because she booked two different sessions.

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

In the supplied rows, Inez has two bookings, Jules has one, and Kai has none. Joining child detail repeats the parent fields once per matching child. An inner join omits unmatched rows; a left join keeps unmatched rows from its left input with NULLs for the missing side. Those result NULLs are separate from missing values stored in a real row.


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

1. Return the maker `name` and booked `session` for every booking, using the maker_id relationship. Order by booking_id.

## Result to aim for

| name | session |
| --- | --- |
| Inez | Woodwork |
| Inez | Repair |
| Jules | Printing |
