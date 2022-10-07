CREATE SCHEMA library;


CREATE TABLE library.book (
    isbn INT PRIMARY KEY,
    title VARCHAR(10),
    author VARCHAR(10),
    pub_year DATE,
    pages_number INT
);

CREATE TABLE library.category (
    category_name VARCHAR(10),
    parent VARCHAR(10)
);

CREATE TABLE library.publisher (
    publisher_name VARCHAR(10) PRIMARY KEY,
    publisher_address VARCHAR(10)
);

CREATE TABLE library.reader (
    reader_id INT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    reader_address VARCHAR(10),
    birthday VARCHAR(10)
);

CREATE TABLE library.instance (
    copy_id INT,
    isbn INT,
    shelf_position INT,
    PRIMARY KEY (copy_id, isbn)
)

CREATE TABLE library.taken (
    reader_id INT,
    copy_id INT,
    isbn INT,
    return_date DATE
)

CREATE TABLE library.books_category (
    isbn INT,
    category_id INT
);


ALTER TABLE library.books_category ADD FOREIGN KEY (isbn) REFERENCES library.book (isbn);

ALTER TABLE library.books_category ADD FOREIGN KEY (category_id) REFERENCES library.category (id);

ALTER TABLE library.taken ADD FOREIGN KEY (reader_id) REFERENCES library.reader (reader_id);

ALTER TABLE library.taken ADD FOREIGN KEY (copy_id) REFERENCES library.instance (copy_id);

ALTER TABLE library.taken ADD FOREIGN KEY (isbn) REFERENCES library.book (isbn);
