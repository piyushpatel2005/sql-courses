---
title: 'Exercise: a ready gear view'
slug: exercise-views
order: 2
language: sql
runtime: sql
lesson_type: coding
summary: Give a recurring filter a reusable query name.
seo_title: 'Exercise: a ready gear view | Introduction to SQL'
seo_description: Give a recurring filter a reusable query name.
seo_keywords:
- SQL
- PostgreSQL
- exercise views
hints:
- Keep the sort key in the view even when the final display omits it.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - name
  - fee
  expected_row_count: 3
  expected_rows:
  - - Hand drill
    - 4
  - - Tent
    - 12
  - - Camp stove
    - 6
---

# Exercise: a ready gear view

The result checks do not prove that a view object was created. Include CREATE VIEW and query it as requested.

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

### Named query result

#### `ready_gear`

One row represents one available equipment entry.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `gear_id` · `integer` | Identifier inherited from `gear.gear_id`. | Logically unique and non-NULL because the base primary key passes through unchanged; not a declared view primary key. |
| `name` · `text` | Display name inherited from `gear.name`. | Inherited required value; no view uniqueness constraint. |
| `fee` · `numeric(6,2)` | Daily borrowing charge inherited from `gear.fee`, in currency units. | Inherited required value; two decimal places. |

This is the view you are about to create, not a preloaded table. Its fields come directly from `gear`; the availability filter does not aggregate or duplicate rows. The view has no separately declared physical key or foreign key, and its rows reflect current base data rather than a frozen snapshot.

The desk repeatedly asks for available equipment. Give that filter a reusable view name, then read the view rather than repeating its WHERE clause. Keep the identifier available inside the view for stable outer ordering.

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

1. Create view ready_gear selecting gear_id, name, fee from gear where available is true. Return name and fee from that view, ordered by gear_id.

## Result to aim for

| name | fee |
| --- | --- |
| Hand drill | 4 |
| Tent | 12 |
| Camp stove | 6 |
