SELECT pack_id,
       ABS(items - 8) AS distance_from_target
FROM packing
ORDER BY pack_id;
