---
title: 'Project: cancel the recorded allocation'
slug: project-cancel
order: 10
language: sql
runtime: sql
lesson_type: coding
summary: Within one committed transaction, restore 3 to supply_id 1 available and delete allocation_id 100. Return supply_id, available, allocation_id, quantity using the same LEFT JOIN and ordering as stage 1.
seo_title: 'Project: cancel the recorded allocation | Introduction to SQL'
seo_description: Within one committed transaction, restore 3 to supply_id 1 available and delete allocation_id 100. Return supply_id, available, allocation_id, quantity using the same LEFT JOIN and ordering as stage 1.
seo_keywords:
- SQL
- PostgreSQL
- project cancel
hints:
- Restore stock and remove its allocation together.
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
    - 10
    - null
    - null
  - - 2
    - 6
    - null
    - null
---

# Project: cancel the recorded allocation

The seed restores stage 1 exactly: Repair packs has 7 available and allocation 100 holds 3. Paint packs is still at 6. The organizer has cancelled that allocation.

Cancellation requires two related changes: put the three packs back and delete the allocation record. Deleting only the record would lose track of three packs; restoring only stock would leave a misleading reservation. Use one transaction again.

You do not rerun stage 1 in the editor. It is already part of this stage's seed. The final report should keep both supplies and show NULL allocation fields for each, demonstrating that cancellation did not remove the supplies themselves. In a real system you might retain an audit record rather than deleting it; this project's chosen model uses deletion to practice a reversible allocation.

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
BEGIN;
UPDATE supplies SET available = available - 3 WHERE supply_id = 1;
INSERT INTO allocations VALUES (100,1,3);
COMMIT;
```

Edit `script.sql`, use Run to inspect the result, then Submit.

## Your Task

1. Within one committed transaction, restore 3 to supply_id 1 available and delete allocation_id 100. Return supply_id, available, allocation_id, quantity using the same LEFT JOIN and ordering as stage 1.

## Result to aim for

| supply_id | available | allocation_id | quantity |
| --- | --- | --- | --- |
| 1 | 10 | NULL | NULL |
| 2 | 6 | NULL | NULL |
