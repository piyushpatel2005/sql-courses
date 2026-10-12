SELECT pack_id,
       SUBSTRING(label
FROM 1 FOR 3) AS prefix
FROM packing
ORDER BY pack_id;
