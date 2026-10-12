SELECT pack_id,
       ROUND(items / 4.0,
       1) AS quarter_items
FROM packing
ORDER BY pack_id;
