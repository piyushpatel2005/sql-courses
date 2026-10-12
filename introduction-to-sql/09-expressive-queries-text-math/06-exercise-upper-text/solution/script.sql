SELECT pack_id,
       UPPER(label) AS upper_label
FROM packing
ORDER BY pack_id;
