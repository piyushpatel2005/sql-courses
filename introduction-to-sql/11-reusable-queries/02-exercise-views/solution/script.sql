CREATE VIEW ready_gear AS
SELECT gear_id, name, fee FROM gear WHERE available = true;
SELECT name, fee FROM ready_gear ORDER BY gear_id;
