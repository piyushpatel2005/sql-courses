---
title: Assign a unique position with ROW_NUMBER
slug: row-number
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Assign each paid order a unique position with a stable tie-breaker.
seo_title: Assign a unique position with ROW_NUMBER | Data Analysis Using SQL
seo_description: Assign each paid order a unique position with a stable tie-breaker.
seo_keywords:
- SQL
- PostgreSQL
- Assign a unique position with ROW_NUMBER
sql:
  seed: seed.sql
---

# Assign a unique position with ROW_NUMBER

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `votes`

One row represents one booth vote-count summary.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `booth` · `text` | Booth label; unique in the sample but not a declared key. | Nullable; `NULL` means no booth value is recorded. |
| `votes` · `integer` | Number of votes recorded for this booth. | Nullable; `NULL` means the votes measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

ROW_NUMBER assigns a distinct position to each row in a window. Add a stable key to break ties when exactly one row must occupy each position. The window order assigns numbers; the final ORDER BY controls display.

Tied vote counts receive different positions because booth breaks the tie. That is useful for a queue with one occupant per position.

```sql run
SELECT booth,
       votes,
       ROW_NUMBER() OVER (ORDER BY votes DESC,
       booth) AS position
FROM votes
ORDER BY votes DESC,
       booth;
```
