---
title: 'Exercise: names containing a space'
slug: exercise-like-patterns
order: 8
language: sql
runtime: sql
lesson_type: coding
summary: Find a text pattern rather than a fixed list of names.
seo_title: 'Exercise: names containing a space | Introduction to SQL'
seo_description: Find a text pattern rather than a fixed list of names.
seo_keywords:
- SQL
- PostgreSQL
- exercise like patterns
hints:
- The space is literal; percent signs allow other characters on either side.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 3
  expected_rows:
  - - Hand drill
  - - Camp stove
  - - Brush kit
---

# Exercise: names containing a space

The desk is checking labels containing more than one word. Search for a literal space anywhere in the name. Do not list the known matching names in an IN clause; a pattern should express the general rule.

## Data model

### Exercise data

These tables are already loaded at the start of this lesson.

#### `gear`

One row represents one equipment catalog entry.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `gear_id` · `integer` | Identifier of the equipment entry. | Primary key. Required; cannot be `NULL`. |
| `name` · `text` | Equipment display name. | Required; cannot be `NULL`. |
| `category` · `text` | Equipment grouping, such as repair, outdoors or art. | Required; cannot be `NULL`. |
| `fee` · `numeric(6,2)` | Daily borrowing charge in currency units, stored to two decimal places. | Required; cannot be `NULL`. |
| `available` · `boolean` | Whether the equipment is available to borrow: true or false. | Required; cannot be `NULL`. |
| `note` · `text` | Optional handling note. | Nullable; `NULL` means no note is recorded. |

Only `note` may be missing. Category labels are sample values, not an enforced vocabulary. No currency code or nonnegative-fee constraint is declared; a fee is a daily charge, not a count of items.

## Supplied data

The setup below is already loaded before each attempt. It is reference material, not code to paste into `script.sql`.

```sql
CREATE TABLE gear (
  gear_id integer PRIMARY KEY,
  name text NOT NULL,
  category text NOT NULL,
  fee numeric(6,2) NOT NULL,
  available boolean NOT NULL,
  note text
);
INSERT INTO gear VALUES
  (1, 'Hand drill', 'repair', 4.00, true, NULL),
  (2, 'Tent', 'outdoors', 12.00, true, 'Dry before return'),
  (3, 'Saw', 'repair', 6.00, false, 'New blade'),
  (4, 'Camp stove', 'outdoors', 6.00, true, NULL),
  (5, 'Brush kit', 'art', 3.00, false, 'Wash bristles');
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Return `name` for gear whose name contains at least one space, ordered by `gear_id`.

## Result to aim for

| name |
| --- |
| Hand drill |
| Camp stove |
| Brush kit |
