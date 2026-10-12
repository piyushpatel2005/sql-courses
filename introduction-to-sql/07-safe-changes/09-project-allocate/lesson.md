---
title: 'Project: record an allocation atomically'
slug: project-allocate
order: 9
language: sql
runtime: sql
lesson_type: coding
summary: Within one committed transaction, subtract 3 from supply_id 1 available and insert allocation (100,1,3). Return supply_id, available, allocation_id, quantity using a LEFT JOIN, ordered by supply_id then allocation_id.
seo_title: 'Project: record an allocation atomically | Introduction to SQL'
seo_description: Within one committed transaction, subtract 3 from supply_id 1 available and insert allocation (100,1,3). Return supply_id, available, allocation_id, quantity using a LEFT JOIN, ordered by supply_id then allocation_id.
seo_keywords:
- SQL
- PostgreSQL
- project allocate
hints:
- Both writes belong between the same BEGIN and COMMIT.
sql:
  seed: seed.sql
  ordered: true
  expected_columns:
  - supply_id
  - available
  - allocation_id
  - quantity
  expected_row_count: 2
  expected_rows:
  - - 1
    - 7
    - 100
    - 3
  - - 2
    - 6
    - null
    - null
---

# Project: record an allocation atomically

A repair fair tracks packs still available and packs allocated to a table. The seed supplies two related tables. You will allocate packs, cancel that allocation, then make a revised allocation with an optional trial. These are three stages of the same workflow, not three unrelated fixtures.

Stage 1 has 10 Repair packs and 6 Paint packs, with no allocation rows. Reserving three Repair packs means subtracting three from available stock and recording allocation 100. Put both changes inside one transaction so they are accepted as a unit.

UPDATE, INSERT, BEGIN, COMMIT, and LEFT JOIN have all been taught. The final report includes supplies with no allocation so you can see untouched stock too. This exercise has fixed data and one session; it does not simulate concurrent allocation or guarantee a production-safe inventory workflow. A real application must also handle competing requests and verify affected rows.

## Restored starting state

This read-only setup runs before your SQL. Add only the new stage in `script.sql`.

```sql
CREATE TABLE supplies (
  supply_id integer PRIMARY KEY,
  name text NOT NULL,
  available integer NOT NULL CHECK (available >= 0)
);
CREATE TABLE allocations (
  allocation_id integer PRIMARY KEY,
  supply_id integer NOT NULL REFERENCES supplies(supply_id),
  quantity integer NOT NULL CHECK (quantity > 0)
);
INSERT INTO supplies VALUES (1,'Repair packs',10),(2,'Paint packs',6);
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Within one committed transaction, subtract 3 from supply_id 1 available and insert allocation (100,1,3). Return supply_id, available, allocation_id, quantity using a LEFT JOIN, ordered by supply_id then allocation_id.

## Result to aim for

| supply_id | available | allocation_id | quantity |
| --- | --- | --- | --- |
| 1 | 7 | 100 | 3 |
| 2 | 6 | NULL | NULL |
