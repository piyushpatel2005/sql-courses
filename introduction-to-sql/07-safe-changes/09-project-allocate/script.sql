-- Earlier stages are restored by the setup.
-- Add the requested transaction before this report.
SELECT s.supply_id, s.available, a.allocation_id, a.quantity
FROM supplies AS s
LEFT JOIN allocations AS a ON a.supply_id = s.supply_id
ORDER BY s.supply_id, a.allocation_id;
