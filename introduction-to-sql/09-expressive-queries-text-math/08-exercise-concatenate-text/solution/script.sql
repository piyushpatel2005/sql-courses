SELECT pack_id,
       label || ' kit' AS display_label
FROM packing
ORDER BY pack_id;
