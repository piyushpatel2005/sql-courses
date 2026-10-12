BEGIN;
UPDATE supplies SET available = available - 3 WHERE supply_id = 1;
INSERT INTO allocations VALUES (100,1,3);
COMMIT;
SELECT s.supply_id, s.available, a.allocation_id, a.quantity
FROM supplies AS s
LEFT JOIN allocations AS a ON a.supply_id = s.supply_id
ORDER BY s.supply_id, a.allocation_id;
