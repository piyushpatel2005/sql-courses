CREATE TABLE shelves (shelf_id integer PRIMARY KEY,room_id integer NOT NULL REFERENCES rooms(room_id) ON DELETE RESTRICT);
SELECT shelf_id,room_id
FROM shelves;
