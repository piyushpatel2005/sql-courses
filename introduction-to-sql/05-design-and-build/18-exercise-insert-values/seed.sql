CREATE TABLE kits (kit_id integer PRIMARY KEY, name text NOT NULL, pieces integer NOT NULL DEFAULT 1 CHECK (pieces > 0));
