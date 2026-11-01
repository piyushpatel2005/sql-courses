---
title: Avoid repeating groups in first normal form
slug: first-normal-form
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Represent each choice as a row instead of a repeating list.
seo_title: Avoid repeating groups in first normal form | Introduction to SQL
seo_description: Represent each choice as a row instead of a repeating list.
seo_keywords:
- SQL
- PostgreSQL
- Avoid repeating groups in first normal form
sql:
  seed: seed.sql
---

# Avoid repeating groups in first normal form

Adding and removing columns changes a table's shape. Before adding a `book_3` column, though, consider what one row is meant to represent. A reader with a third choice should not force us to change the schema again.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `selections`

One row represents one reader-book choice.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `reader` · `text` | Reader name used as an illustrative label. | Nullable; `NULL` means no reader value is recorded. |
| `book` · `text` | Title of one selected book, not a comma-separated book list. | Nullable; `NULL` means no book value is recorded. |

These text labels illustrate row shape. Neither a key nor a foreign key is declared, so the same choice can be stored more than once.

This table has no declared primary or unique key; distinct sample values are not a uniqueness guarantee.

First normal form gives each field one value under the chosen data model and avoids numbered repeating groups such as book_1 and book_2. Store one selection per row instead of a comma-separated list. This lets a query address one relationship without parsing text.

The supplied selection table already follows this design. A reader who chooses another book gets another row, not another book column. Inspect the result with that possible addition in mind.

For example, a single row `Ana | Maps, Birds` would require splitting text to find one selected book. The supplied table instead stores `Ana | Maps` and `Ana | Birds` as two rows. Each row means one reader-book choice. “One value” depends on the model: an ordinary book title may contain a comma without becoming a list of books. These small text-only rows illustrate the shape; the later link-table lesson uses identifiers and declared keys to protect the relationships.

```sql run
SELECT reader,book
FROM selections
ORDER BY reader,book;
```
