SELECT w.title,r.building
FROM workshops w
JOIN rooms r ON r.room_id=w.room_id
ORDER BY w.workshop_id;
