SELECT pack_id,
       CHAR_LENGTH(label) AS characters
FROM packing
ORDER BY pack_id;
