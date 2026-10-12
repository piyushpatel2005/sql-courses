BEGIN;
UPDATE gear SET fee = 5 WHERE gear_id = 1;
SAVEPOINT corrected;
UPDATE gear SET fee = 50 WHERE gear_id = 2;
ROLLBACK TO corrected;
COMMIT;
SELECT gear_id, fee FROM gear ORDER BY gear_id;
