BEGIN;
UPDATE gear SET fee = 99 WHERE gear_id = 2;
ROLLBACK;
SELECT gear_id, fee FROM gear ORDER BY gear_id;
