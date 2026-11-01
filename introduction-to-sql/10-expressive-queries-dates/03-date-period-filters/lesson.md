---
title: Filter a whole calendar period
slug: date-period-filters
order: 3
language: sql
lesson_type: interactive
runtime: sql
summary: Select a month with an inclusive start and exclusive next-month boundary.
seo_title: Filter a whole calendar period | Introduction to SQL
seo_description: Select a month with an inclusive start and exclusive next-month boundary.
seo_keywords:
- SQL
- PostgreSQL
- Filter a whole calendar period
sql:
  seed: seed.sql
---

# Filter a whole calendar period

A report for April should include its first day and stop before May begins. Use a half-open condition: date >= start AND date < next_start. Adjacent periods then do not share a boundary.

## Data model

### Example data

These tables are already loaded at the start of this lesson.

#### `shipments`

One row represents one shipment.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `parcel_id` · `integer` | Identifier of this shipment, not a declared reference to the earlier `parcels` fixture. | Primary key. Required; cannot be `NULL`. |
| `sent_on` · `date` | Dispatch calendar date; no time of day or time zone. | Nullable; `NULL` means no sent on value is recorded. |
| `delivered_on` · `date` | Delivery calendar date; no time of day or time zone. | Nullable; `NULL` means no delivered on value is recorded. |

A missing date means that date is unrecorded. It does not imply zero travel days. No foreign key or date-order check is declared; the sample dates are all recorded.

The typed DATE constants make the comparison explicit. The same boundary pattern works for timestamps when the reporting zone is defined. It avoids guessing a day's final representable instant. Run the parcel list and check which source date controls membership: sent_on, not delivered_on.

The selected `sent_on::text` uses PostgreSQL shorthand for `CAST(sent_on AS text)`, which you already practiced. It displays a calendar label; the WHERE clause still compares the original date values, not formatted text. The lower boundary is included and May 1 is excluded. For these date-only values, an inclusive April 30 endpoint could work too; the next-period pattern also avoids end-of-day mistakes when a report later uses timestamps.

```sql run
SELECT parcel_id,
       sent_on::text AS sent_on
FROM shipments
WHERE sent_on >= DATE '2025-04-01' AND sent_on < DATE '2025-05-01'
ORDER BY parcel_id;
```
