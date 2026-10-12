ALTER TABLE kits ADD COLUMN inspected boolean NOT NULL DEFAULT false;
SELECT kit_id,
       name,
       inspected
FROM kits
ORDER BY kit_id;
