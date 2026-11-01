---
title: Calculate calendar days between dates
slug: date-differences
order: 1
language: sql
lesson_type: interactive
runtime: sql
summary: Calculate the number of calendar days between two dates.
seo_title: Calculate calendar days between dates | Introduction to SQL
seo_description: Calculate the number of calendar days between two dates.
seo_keywords:
- SQL
- PostgreSQL
- Calculate calendar days between dates
sql:
  seed: seed.sql
---

# Calculate calendar days between dates

The number lessons transformed quantities. Dates also support calculations, but their types determine the unit of the answer. The new `shipments` example stores one shipment per `parcel_id`, with `sent_on` and `delivered_on` as dates. The exercise's separate `rentals` table has one loan per `rental_id`, with `borrowed_on` and `returned_on`. These fixtures do not link to the earlier parcel or gear tables.

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

A date stores a calendar day without a time of day. The typed literal DATE '2025-04-01' explicitly creates that type. Subtracting one date from another returns a whole number of days; adding an integer to a date advances it by that many days.

The parcel report subtracts dispatch from delivery. This is calendar arithmetic, not elapsed hours across daylight-saving transitions. A timestamp stores a date and time, and a timestamp with time zone represents an instant. Those distinctions matter when a report moves beyond whole dates.

For shipment 1, April 6 minus April 3 gives 3 days, not 4 inclusive calendar labels. All dates in this fixture are recorded, although the schema permits NULL. If a delivery or return date were missing, subtraction would return NULL, not zero days or a count through today. Reversing the operands would reverse the sign.

```sql run
SELECT parcel_id,
       delivered_on - sent_on AS travel_days
FROM shipments
ORDER BY parcel_id;
```
