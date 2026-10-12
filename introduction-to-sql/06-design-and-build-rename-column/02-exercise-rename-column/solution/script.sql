ALTER TABLE kits RENAME COLUMN name TO kit_name;
SELECT kit_id,
       kit_name
FROM kits
ORDER BY kit_id;
