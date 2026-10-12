SELECT pack_id,
       CEIL(items / 4.0) AS boxes
FROM packing
ORDER BY pack_id;
