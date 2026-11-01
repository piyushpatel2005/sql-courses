---
title: Count matching rows with FILTER
slug: conditional-denominators
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Count a qualifying subset without removing the other input rows.
seo_title: Count matching rows with FILTER | Data Analysis Using SQL
seo_description: Count a qualifying subset without removing the other input rows.
seo_keywords:
- SQL
- PostgreSQL
- Count matching rows with FILTER
sql:
  seed: seed.sql
---

# Count matching rows with FILTER

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `requests`

One row represents one submitted request.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `desk` · `text` | Submitting desk label; several requests can share it. | Nullable; `NULL` means no desk value is recorded. |
| `fulfilled` · `boolean` | Whether this request was fulfilled: true for success, false for failure. | Nullable; `NULL` means the fulfillment outcome is unknown, not false. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

The denominator counts request rows, including failures. A missing fulfillment flag would be unknown, not false; FILTER counts only true flags.

FILTER attaches a condition to one aggregate without removing rows from the surrounding query. COUNT(*) FILTER (WHERE fulfilled) can therefore sit beside an unconditional COUNT(*) over the same groups.

The earlier summaries filtered out unwanted rows. A rate needs to keep the failures in its denominator, so here the condition belongs to one count rather than the whole query. In this separate `requests` demo, one row is one submitted request. `desk` is a text group label and `fulfilled` is a boolean (true or false here); the demo declares no request primary key.

The tool desk needs both submitted and fulfilled counts. A WHERE on the whole query would remove failures from both counts. Run the example and check that unsuccessful requests still contribute to requests. This distinction will matter when the next lesson divides one count by the other.

```sql run
SELECT desk,
       COUNT(*) AS requests,
       COUNT(*) FILTER (WHERE fulfilled) AS fulfilled
FROM requests
GROUP BY desk
ORDER BY desk;
```
