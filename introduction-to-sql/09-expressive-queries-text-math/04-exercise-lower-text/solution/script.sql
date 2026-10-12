SELECT pack_id,
       LOWER(label) AS lower_label
FROM packing
ORDER BY pack_id;
