---
title: 'Exercise: Display a fallback with COALESCE'
slug: exercise-coalesce-fallbacks
order: 20
language: sql
lesson_type: coding
runtime: sql
summary: Display a label for missing notes without changing the source.
seo_title: 'Exercise: Display a fallback with COALESCE | Introduction to SQL'
seo_description: Display a label for missing notes without changing the source.
seo_keywords:
  - SQL
  - PostgreSQL
  - Display a fallback with COALESCE
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
    - name
    - display_note
  expected_row_count: 5
  expected_rows:
    - - Hand drill
      - No note
    - - Tent
      - Dry before return
    - - Saw
      - New blade
    - - Camp stove
      - No note
    - - Brush kit
      - Wash bristles
hints:
  - COALESCE reads left to right and stops at the first non-NULL argument.
---

# Exercise: Display a fallback with COALESCE

The lending display should distinguish an absent note from a blank space in the report.

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

## Your Task

1. Return name and COALESCE(note, 'No note') AS display_note, ordered by gear_id.

Write your query in `script.sql`. Use Run to inspect it, then Submit.
