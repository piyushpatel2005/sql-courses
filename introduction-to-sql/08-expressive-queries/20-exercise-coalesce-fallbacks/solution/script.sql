SELECT name,
       COALESCE(note,
       'No note') AS display_note
FROM gear
ORDER BY gear_id;
