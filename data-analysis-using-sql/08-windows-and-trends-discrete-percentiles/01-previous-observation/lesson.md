---
title: Look back one observation with LAG
slug: previous-observation
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Read the preceding purchase within each member's sequence.
seo_title: Look back one observation with LAG | Data Analysis Using SQL
seo_description: Read the preceding purchase within each member's sequence.
seo_keywords:
- SQL
- PostgreSQL
- Look back one observation with LAG
sql:
  seed: seed.sql
---

# Look back one observation with LAG

## Data model

### Example data

These objects are loaded at the start. Only the query inputs and their required lineage are listed; other tables in a shared seed are not part of this report.

#### `readings`

One row represents one recorded sensor observation.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `day` · `date` | Observation calendar date; the supplied dates are unique but sparse. | Nullable; `NULL` means the calendar date is unrecorded. |
| `reading` · `integer` | Sensor observation in the sensor own units; the fixture does not specify a physical unit. | Nullable; `NULL` means no reading value is recorded. |

No primary or unique key is declared; distinct sample identifiers are not a uniqueness guarantee.

A missing calendar day is not a measured zero. LAG and LEAD move by observations, not elapsed days; no date key is declared.

Ranking told us where a row sits. `LAG(value)` reads the preceding row under the window `ORDER BY`, so we can compare its measure with the current one. `PARTITION BY` restarts the sequence for each entity. If there is no such neighbor, the default result is NULL.

The separate `readings` fixture contains one recorded sensor observation per date: `day` is a date and `reading` is an integer in the sensor's own units. The supplied dates are unique, though the demo declares no primary key. February 2 is absent; it is not a measured zero.

The function moves by rows, not elapsed days. The sensor has a gap in its dates, so the next visible row is not necessarily tomorrow and the prior row is not necessarily yesterday. Keep that grain in the interpretation. Add a stable key when timestamps tie.

```sql run
SELECT day::text AS day, reading,
       LAG(reading) OVER (ORDER BY day) AS neighbor
FROM readings
ORDER BY day;
```
