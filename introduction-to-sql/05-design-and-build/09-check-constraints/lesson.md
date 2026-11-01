---
title: Validate a condition with CHECK
slug: check-constraints
order: 9
language: sql
lesson_type: interactive
runtime: sql
summary: Reject a nonpositive capacity with a row-level condition.
seo_title: Validate a condition with CHECK | Introduction to SQL
seo_description: Reject a nonpositive capacity with a row-level condition.
seo_keywords:
- SQL
- PostgreSQL
- Validate a condition with CHECK
sql:
  seed: seed.sql
---

# Validate a condition with CHECK

CHECK rejects a row when its condition is false. CHECK (capacity > 0) therefore rejects zero and negative capacities. It allows an unknown condition, so use NOT NULL too when a missing capacity is forbidden. The constraint protects future writes, not just a report.

## Data model

### Example data

This example starts without tables. The following dictionaries describe the tables to create, not preloaded tables.

#### `locations`

One row represents one location.

| Field / SQL type | Meaning | Rules |
| --- | --- | --- |
| `location_id` · `integer` | Identifier of the location. | Primary key. Required; cannot be `NULL`. |
| `capacity` · `integer` | Whole-number capacity assigned to the location. | Required; cannot be `NULL`. Check: `capacity > 0`. |

Read the two capacity rules separately: NOT NULL requires a recorded value, and CHECK requires it to be positive. Neither rule replaces the other. IF NOT EXISTS allows another Run without recreating the table; it does not validate an existing definition.

```sql run
CREATE TABLE IF NOT EXISTS locations (location_id integer PRIMARY KEY,
       capacity integer NOT NULL CHECK (capacity > 0));
SELECT location_id,
       capacity
FROM locations;
```
