-- The setup supplies this stage's starting state.
-- TODO: Step 1: Add the requested transaction here, before the supplied report.
SELECT s.supply_id, s.available, a.allocation_id, a.quantity
FROM supplies AS s
LEFT JOIN allocations AS a ON a.supply_id = s.supply_id
ORDER BY s.supply_id, a.allocation_id;
