SELECT pack_id,
       CAST(items AS numeric) / 4 AS quarter_items
FROM packing
ORDER BY pack_id;
