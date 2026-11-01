---
title: Restrict a total to a trailing row window
slug: rolling-frames
order: 7
language: sql
lesson_type: interactive
runtime: sql
summary: Limit each purchase total to the current and two preceding orders.
seo_title: Restrict a total to a trailing row window | Data Analysis Using SQL
seo_description: Limit each purchase total to the current and two preceding orders.
seo_keywords:
- SQL
- PostgreSQL
- Restrict a total to a trailing row window
sql:
  seed: seed.sql
---

# Restrict a total to a trailing row window

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `daily_refills`

One row represents one prepared daily refill count.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Calendar date of the refill count; every displayed date is present in this sample. | Nullable; `NULL` means the calendar date is unrecorded. |
| `refills` · `integer` | Number of refills on this date; a stored zero is observed inactivity. | Nullable; `NULL` means the refills measure is unrecorded, not zero. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

Dates are unique in the fixture but not constrained. A row frame spans days only while this one-row-per-day input is maintained.

ROWS BETWEEN 2 PRECEDING AND CURRENT ROW includes the current row and up to two predecessors. It uses fewer rows near the partition start. A three-row frame means three days only when the input has one row for every day. On purchases it means three purchases, regardless of time gaps.

On the final day, the frame no longer includes the earliest day. Here rows are days; in the exercise they are purchases.

```sql run
SELECT day::text AS day, refills,
       SUM(refills) OVER (
         ORDER BY day
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS total
FROM daily_refills
ORDER BY day;
```

This separate revenue example shows the same frame at March 4: three complete daily rows contribute. Its dollars are not the refill counts in the demo.

![At March 4, the three-day total is 160 USD. March 1 is outside this frame.](three-day-window.svg)
