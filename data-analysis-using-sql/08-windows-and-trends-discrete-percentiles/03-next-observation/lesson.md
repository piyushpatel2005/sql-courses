---
title: Look ahead one observation with LEAD
slug: next-observation
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Read the following purchase within each member's sequence.
seo_title: Look ahead one observation with LEAD | Data Analysis Using SQL
seo_description: Read the following purchase within each member's sequence.
seo_keywords:
- SQL
- PostgreSQL
- Look ahead one observation with LEAD
sql:
  seed: seed.sql
---

# Look ahead one observation with LEAD

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

`LAG` looked backward. `LEAD(value)` uses the same ordered sequence to read the following row instead. `PARTITION BY` still restarts the sequence for each entity, and the last row gets NULL because it has no following observation.

In the same sparse sensor fixture, February 1 looks ahead to February 3, not February 2. Run the example and compare that first result with the earlier LAG output. A following observation is not a prediction: it is a later row already present in this snapshot.

```sql run
SELECT day::text AS day, reading,
       LEAD(reading) OVER (ORDER BY day) AS neighbor
FROM readings
ORDER BY day;
```
