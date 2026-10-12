SELECT pack_id,
       TRIM(label) AS clean_label
FROM packing
ORDER BY pack_id;
