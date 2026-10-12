ALTER TABLE kits DROP COLUMN import_note;
SELECT kit_id,
       name
FROM kits
ORDER BY kit_id;
