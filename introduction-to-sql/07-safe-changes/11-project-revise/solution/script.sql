BEGIN;
UPDATE supplies SET available = available - 2 WHERE supply_id = 2;
INSERT INTO allocations VALUES (101,2,2);
SAVEPOINT core_allocation;
UPDATE supplies SET available = available - 1 WHERE supply_id = 1;
INSERT INTO allocations VALUES (102,1,1);
ROLLBACK TO core_allocation;
COMMIT;
SELECT s.supply_id, s.available, a.allocation_id, a.quantity
FROM supplies AS s
LEFT JOIN allocations AS a ON a.supply_id = s.supply_id
ORDER BY s.supply_id, a.allocation_id;
