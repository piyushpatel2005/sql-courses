---
title: 'Exercise: gear without a note'
slug: exercise-null-values
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Find missing notes without confusing NULL with an empty string.
seo_title: 'Exercise: gear without a note | Introduction to SQL'
seo_description: Find missing notes without confusing NULL with an empty string.
seo_keywords:
- SQL
- PostgreSQL
- exercise null values
hints:
- Use IS NULL, not equality with NULL.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  expected_row_count: 2
  expected_rows:
  - - Hand drill
  - - Camp stove
---

# Exercise: gear without a note

Some items have no handling note. Find those records so the desk can review them. A missing note does not mean that the item itself is missing, and the text string NULL would not represent the same thing.

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

1. Return `name` for gear whose `note` is NULL, ordered by `gear_id`.

## Result to aim for

| name |
| --- |
| Hand drill |
| Camp stove |
