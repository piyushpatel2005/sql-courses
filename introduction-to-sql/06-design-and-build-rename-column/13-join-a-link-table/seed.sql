CREATE TABLE readers (reader_id integer PRIMARY KEY, name text);
CREATE TABLE books (book_id integer PRIMARY KEY, title text);
CREATE TABLE reading_list (reader_id integer REFERENCES readers, book_id integer REFERENCES books, PRIMARY KEY(reader_id,book_id));
INSERT INTO readers VALUES (1,'Luz'),(2,'Omar');
INSERT INTO books VALUES (10,'Orchards'),(20,'Seashores');
INSERT INTO reading_list VALUES (1,10),(2,10),(2,20);
