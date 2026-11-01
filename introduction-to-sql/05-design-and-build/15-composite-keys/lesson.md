---
title: Identify a relationship with a composite key
slug: composite-keys
order: 15
language: sql
lesson_type: interactive
runtime: sql
summary: Use a pair of identifiers as one relationship key.
seo_title: Identify a relationship with a composite key | Introduction to SQL
seo_description: Use a pair of identifiers as one relationship key.
seo_keywords:
- SQL
- PostgreSQL
- Identify a relationship with a composite key
sql:
  seed: seed.sql
---

# Identify a relationship with a composite key

A primary key can contain more than one column. PRIMARY KEY (person_id, session_id) requires a unique, non-NULL pair. Each individual identifier may still appear in other pairs. This suits a many-to-many relationship.

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `reading_choices`

One row represents one reader-book choice.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `reader_id` · `integer` | Reader identifier forming the reader half of the choice. | Part of the composite primary key. Required; cannot be `NULL`. |
| `book_id` · `integer` | Book identifier forming the book half of the choice. | Part of the composite primary key. Required; cannot be `NULL`. |

The pair is the primary key; neither component is unique alone. No reader or book parent table or foreign key exists in this lesson, so the identifiers do not guarantee a matching parent.

The demo table represents a reader choosing a book. It starts empty because this lesson defines its identity rule; insertion comes next. Separate foreign keys can protect the two parent relationships once those catalogs exist. Do not make reader_id alone unique, or one reader could choose only one book.

```sql run
CREATE TABLE IF NOT EXISTS reading_choices (reader_id integer,book_id integer,PRIMARY KEY(reader_id,book_id));
SELECT reader_id,book_id
FROM reading_choices;
```
